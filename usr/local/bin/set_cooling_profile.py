#!/usr/bin/env python
import os
import sys
import time
import logging

"""Tweak cooling profile to keep cooling fan quiet when laptop is idle.
Do this by rewriting thermal tipping points in Embedded Controller memory via ACPI.
Requires "acpi_call" kernel module to be loaded.
"""


def call_acpi(command):
    with open('/proc/acpi/call', 'w') as acpi_call:
        logging.info(command)
        acpi_call.write(command)
    with open('/proc/acpi/call') as acpi_call:
        response = acpi_call.read()
    return response


def update_table(tipping_points):
    assert len(tipping_points) <= 8

    start_offset = 0x537
    for i, temperature in enumerate(tipping_points):
        addr = start_offset + i
        cmd = '\_SB.PCI0.LPCB.EC0.WRAM {} {}'.format(hex(addr), hex(temperature))   # noqa
        call_acpi(cmd)


def set_quiet_profile():
    logging.info('Setting quiet cooling profile. It may take a few minutes for it to become active.')
    quiet_tipping_points = [42, 47, 52, 57, 62, 67, 72, 80]
    update_table(quiet_tipping_points)


def set_default_profile():
    logging.info('Setting default cooling profile.')
    default_tipping_points = [35, 40, 45, 50, 55, 60, 65, 80]
    update_table(default_tipping_points)


def read_current_profile():
    start_offset = 0x537
    for i in range(8):
        addr = start_offset + i
        cmd  = '\_SB.PCI0.LPCB.EC0.RRAM {}'.format(hex(addr))  # noqa
        res = call_acpi(cmd)
        try:
            temperature = int(res.replace('alled', '').replace('\x00', ''), 0)
            logging.info('Read temperature: {}'.format(temperature))
        except ValueError as e:
            logging.error(
                'Could not read temperature from address {} due to {}'.format(addr, e)
            )


def check_acpi_call_exists():
    retry_wait = 10
    while not os.path.exists('/proc/acpi/call') and retry_wait:
        time.sleep(0.5)
        retry_wait -= 1
    assert os.path.isfile('/proc/acpi/call')


def main():
    check_acpi_call_exists()

    action = 'quiet' if len(sys.argv) < 2 else sys.argv[1]
    assert action in ['quiet', 'default', 'read']

    if action == 'quiet':
        set_quiet_profile()
    elif action == 'default':
        set_default_profile()
    elif action == 'read':
        read_current_profile()


if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO)
    main()

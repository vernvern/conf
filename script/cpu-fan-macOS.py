import sys
import subprocess


def main():
    detail = subprocess.run('/usr/local/bin/istats', shell=True, capture_output=True).stdout.decode().split('\n')
    cpu = detail[1].split()[2]
    fan = detail[5].split()[3] + " RPM"

    print("{}\n{}".format(cpu, fan))


if __name__ == '__main__':
    main()

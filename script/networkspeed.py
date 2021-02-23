import time
import psutil

def main():
    old_value = 0
    old_value_send = 0

    while True:
        new_value = psutil.net_io_counters().bytes_recv
        new_value_send = psutil.net_io_counters().bytes_sent
        if old_value:
            send_stat(new_value - old_value, new_value_send - old_value_send)
            break

        old_value = new_value
        old_value_send = new_value_send

        time.sleep(1)

def convert_to_mbit(value):
    return value/1024./1024.

def send_stat(value_recv, value_send):
    print("{1:.2f}MB▲\n{0:.2f}MB▼".format(convert_to_mbit(value_send), convert_to_mbit(value_recv)))


if __name__ == '__main__':
    main()

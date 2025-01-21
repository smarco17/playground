import serial
import serial.tools.list_ports


if __name__ == '__main__':
    for port in serial.tools.list_ports.comports():
        print(f'{port}')
    sport = serial.Serial(port='COM10', baudrate=9600, parity='N')

    wdat='Hello, World\r\n'
    wdat=wdat.encode('utf-8')
    sport.write(wdat)

    rdat=sport.readline()
    rdat=rdat.strip()
    rdat=rdat.decode('utf-8')

    print(rdat)

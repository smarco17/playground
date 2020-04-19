from speedtest import Speedtest

def get_upload_speed(count:int) -> float:
    st = get_st_obj()
    sp = st.upload()
    return sp

def get_download_speed(count:int) -> float:
    st = get_st_obj()
    sp = st.download()
    return sp

def get_st_obj() -> Speedtest:
    servers = []
    st = Speedtest()
    st.get_servers(servers=servers)
    st.get_best_server()
    return st

if __name__ == '__main__':
    print("{0:>6.2f} Mbps".format(get_upload_speed(0)/(1024**2)))
    print("{0:>6.2f} Mbps".format(get_download_speed(0)/(1024**2)))

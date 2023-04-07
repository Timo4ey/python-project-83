import requests


class GetRequest:
    def __init__(self, link, *args, **kwargs):
        self.data = self.get_data(link)

    @staticmethod
    def get_data(link):
        with requests.get(link) as data:
            return data

    def status_code(self):
        return self.data.status_code


if __name__ == '__main__':
    g = GetRequest("https://stackoverflow.com/")
    print(g.status_code())

import validators
from urllib.parse import urlparse


class Validator:

    def __init__(self, link):
        self.base_link = link
        self.is_valid = self.validate_link(link)
        if self.is_valid:
            self.cut_link(link)

    @staticmethod
    def validate_link(url):
        return validators.url(url)

    def cut_link(self, url):
        self._link = urlparse(url)._replace(path="",
                                            params="",
                                            query="",
                                            fragment="").geturl()

    @property
    def get_link(self):
        return self._link

    @get_link.setter
    def get_link(self, link):
        if self.validate_link(link):
            self.cut_link(link)

    def validate_unique_link(self, links):
        result = [x for x in links if x.name == self._link]
        print(result)
        return result

    def is_correct_len(self):
        if len(f'{self.base_link}') > 255:
            return False
        return True


if __name__ == '__main__':
    links_ = [{'name': 'https://ru.hexlet.io'},
              {'name': 'https://www.youtube.com'},
              {'name': 'https://ru.wikipedia.org'}]
    t = "https://ru.hexlet.io/projects/83/members/30036?step=3"
    v = Validator(t)
    print(v.get_link)
    # link = 'https://test.com'
    # v = Validator(link)
    # if v.valid:
    #     print('a')
    # print(validators.url(link))
    # a = urlparse("https://developer.mozilla.org/en-US/docs/Web/CSS/bottom")
    # print(a._replace(path="").geturl())
    # print(urljoin(a.scheme, a.netloc))
    # print(urlparse(link))


# class Validator:
#     def __init__(self, link):
#         self.link = link
#         self.cat_link = None
#
#     def validate_link(self):
#         pattern = r"^htt(p|ps)://(www.|)[a-zA-z0-9.]{2,63}\.[a-z]{2,3}+"
#         frame = re.match(pattern, self.link)
#         if not frame:
#             return False
#         self.cat_link = frame.group()
#         return self.cat_link
#
#     def validate_unique_link(self, links):
#         result = [x for x in links if x.name == self.cat_link]
#         return result

import validators
from urllib.parse import urlparse


class Validator:

    def __init__(self, link):
        self._link = link
        self.is_valid = {}
        self.new_link = None

    def cut_link(self):
        self.new_link = urlparse(
            self._link)._replace(path="",
                                 params="",
                                 query="",
                                 fragment="").geturl()
        return self.new_link

    def validation(self):
        length = len(f'{self._link}')
        if not length:
            self.is_valid['empty'] = True
        if not validators.url(self._link):
            self.is_valid['wrong'] = True
        if length > 255:
            self.is_valid['size'] = True


if __name__ == '__main__':
    links_ = [{'name': 'https://ru.hexlet.io'},
              {'name': 'https://www.youtube.com'},
              {'name': 'https://ru.wikipedia.org'}]
    t = "https://ru.hexlet.io/projects/83/members/30036?step=3"
    v = Validator(t)
    v.validation()
    if v.is_valid:
        print(v.is_valid)
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

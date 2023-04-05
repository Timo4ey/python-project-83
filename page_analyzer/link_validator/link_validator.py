import re


class Validator:
    def __init__(self, link):
        self.link = link
        self.cat_link = None

    def validate_link(self):
        pattern = r"^htt(p|ps)://(www.|)[a-zA-z0-9.]{2,63}\.[a-z]{2,3}+"
        frame = re.match(pattern, self.link)
        if not frame:
            return False
        self.cat_link = frame.group()
        return self.cat_link

    def validate_unique_link(self, links):
        result = [x for x in links if x.name == self.cat_link]
        return result


if __name__ == '__main__':
    links_ = [{'name': 'https://ru.hexlet.io'},
              {'name': 'https://www.youtube.com'},
              {'name': 'https://ru.wikipedia.org'}]
    link = 'https://developer.mozilla.org/en-US/docs/Web/CSS/bottom'
    validator = Validator(link)

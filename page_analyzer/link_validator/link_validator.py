import re


def validate_link(string):
    pattern = r"^htt(p|ps)://(www.|)[a-zA-z0-9.]{2,63}\.[a-z]{2,3}\w+"
    frame = re.match(pattern, string)
    print(frame)
    return frame is not None


if __name__ == '__main__':
    print(validate_link('https://ru.hexlet.com'))
    print(validate_link('http://hexlet.ru'))

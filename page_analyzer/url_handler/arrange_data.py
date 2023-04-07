

def arrange_data(array: list[tuple]) -> dict:
    hash_table = {}
    for item in array:
        if not hash_table.get(item[0]):
            hash_table[item[0]] = {'name': item[1],
                                   'status_code': item[2],
                                   'created_at': item[3]}
        elif hash_table.get(item[0])['created_at'] < item[3]:
            hash_table[item[0]].update({'name': item[1],
                                        'status_code': item[2],
                                        'created_at': item[3]})
    return hash_table

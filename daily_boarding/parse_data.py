import json

def prune_data(data):
    pruned = []
    for datum in data:
        #check against invalid entries
        if datum[8] is not None and datum[9] is not None and datum[10] is not None and datum[11] is not None:
            datum_s = "";
            datum_s += datum[8]
            datum_s += " " + datum[9]
            datum_s += " " + datum[10]
            datum_s += " " + datum[11]
            pruned.append(datum_s)
    return pruned

def write_pruned(data):
    f = open("daily_boarding_pruned.txt", "w")
    f.writelines(data)
    f.close()       
        

def main():
    json_f = open("daily_boarding_raw.json")
    data_j = json.load(json_f)
    data = data_j["data"]
    pruned = prune_data(data)
    write_pruned(pruned)
    

if __name__ == "__main__":
    main()

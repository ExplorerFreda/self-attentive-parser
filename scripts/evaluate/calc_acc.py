import argparse
import regex 


def calc_correct(pred, gold):
    assert len(pred) == len(gold)
    gold = sorted(gold, key=lambda x: x[0])
    pred = sorted(pred, key=lambda x: x[0])
    assert gold[-1][0] == pred[-1][0] == len(gold)
    return sum([pred[i][1] == gold[i][1] for i in range(len(gold))])


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--input', '-i', type=str)
    parser.add_argument('--label', '-l', action='store_true', default=False)
    args = parser.parse_args()

    deps = list()
    dep_list = list()
    for line in open(args.input):
        line = line.strip()
        if len(line) == 0:
            deps.append(dep_list)
            dep_list = list()
            continue
        rel = regex.findall('(.+)\(.+-.+, .+-.+\)', line)
        head = regex.findall('-(\d+),', line)
        pos = regex.findall('-(\d+)\)', line)
        try:
            assert len(rel) == 1
            assert len(head) == 1
            assert len(pos) == 1
        except:
            from IPython import embed; embed(using=False)
        head, pos = int(head[0]), int(pos[0])
        if args.label:
            dep_list.append((pos, (head, rel)))
        else:
            dep_list.append((pos, head))

    if len(dep_list) > 0:
        deps.append(dep_list)
    tc = tt = 0
    for i in range(0, len(deps), 2):
        correct, total = calc_correct(deps[i], deps[i+1]), len(deps[i])
        tc += correct
        tt += total
    print(f'{tc/tt*100:.1f}')

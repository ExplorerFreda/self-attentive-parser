import nltk 


WORD_TAGS = ['CC', 'CD', 'DT', 'EX', 'FW', 'IN', 'JJ', 'JJR', 'JJS', 'LS', 'MD', 'NN', 'NNS', 'NNP', 'NNPS', 'PDT',
             'POS', 'PRP', 'PRP$', 'RB', 'RBR', 'RBS', 'RP', 'SYM', 'TO', 'UH', 'VB', 'VBD', 'VBG', 'VBN', 'VBP', 'VBZ',
             'WDT', 'WP', 'WP$', 'WRB']


def tokens2list(tokens, rm_punct=False):
    stack = []
    i = 0
    label = None
    while i < len(tokens):
        if tokens[i] == '(':
            stack.append(tokens[i])
            label = tokens[i+1]
            i += 2  # skip the following label
        elif tokens[i] == ')':
            top = -1
            while stack[top] != '(':
                top -= 1
            if top == -1:
                stack = stack[:top]
            else:
                top_bracket = stack[top+1:]
                stack = stack[:top] + [top_bracket]
            i += 1
        else:
            if rm_punct:
                if label in WORD_TAGS:
                    stack.append(tokens[i])
            else:
                stack.append(tokens[i])
            i += 1
    assert len(stack) == 1
    def clean(tree):
        if type(tree) is str:
            return tree
        children = list()
        for child in tree:
            if len(child) != 0:
                children.append(clean(child))
        if len(children) == 1:
            return children[0]
        else:
            return children
    return clean(stack[0])


def tree2str(tree):
    if type(tree) is str:
        return tree
    strs = [tree2str(item) for item in tree]
    return '({})'.format(' '.join(strs))


def get_brackets(tree, idx=0):
    brackets = set()
    if isinstance(tree, list) or isinstance(tree, nltk.Tree):
        for node in tree:
            node_brac, next_idx = get_brackets(node, idx)
            if next_idx - idx > 1:
                brackets.add((idx, next_idx))
                brackets.update(node_brac)
            idx = next_idx
        return brackets, idx
    else:
        return brackets, idx + 1

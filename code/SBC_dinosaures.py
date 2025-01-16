class FactBase:
    def __init__(self):
        self.facts = set()

    def add_fact(self, fact):
        self.facts.add(fact)

    def has_fact(self, fact):
        return fact in self.facts

class Rule:
    def __init__(self, condition, conclusion):
        self.condition = condition
        self.conclusion = conclusion

class KnowledgeBase:
    def __init__(self):
        self.facts = FactBase()
        self.rules = []

    def add_fact(self, fact):
        self.facts.add_fact(fact)

    def add_rule(self, condition, conclusion):
        self.rules.append(Rule(condition, conclusion))

    def condition_true(self, condition):
        if isinstance(condition, str):
            return self.facts.has_fact(condition)
        elif isinstance(condition, tuple):
            op, *operands = condition
            if op == 'et':
                return all(self.condition_true(sub_cond) for sub_cond in operands)
            elif op == 'ou':
                return any(self.condition_true(sub_cond) for sub_cond in operands)
        return False

    def forward_chaining(self):
        new_fact_added = True
        while new_fact_added:
            new_fact_added = False
            for rule in self.rules:
                if not self.facts.has_fact(rule.conclusion) and self.condition_true(rule.condition):
                    self.facts.add_fact(rule.conclusion)
                    print(f"Nouveau fait : {rule.conclusion}")
                    new_fact_added = True

    def backward_chaining(self, goal):
        if self.facts.has_fact(goal):
            return True
        for rule in self.rules:
            if rule.conclusion == goal and self.condition_true(rule.condition):
                return True
        return False

# Initialisation de la base de connaissances
kb = KnowledgeBase()

# Ajout des faits
facts = [
    "herrerasauridae(herrerasaurus)", "herrerasauridae(staurikosaurus)",
    "coelophysoidea(coelophysis)", "coelophysoidea(liliensternus)", "coelophysoidea(dilophosaurus)",
    "ceratosauria(ceratosaurus)", "ceratosauria(majungasaurus)", "ceratosauria(carnotaurus)",
    "megalosauroidea(spinosaurus)", "megalosauroidea(suchomimus)", "megalosauroidea(torvosaurus)",
    "avetheropoda(allosaurus)", "avetheropoda(tyrannosaurus)", "avetheropoda(velociraptor)",
    "sauropodomorphesBasaux(anchisaurus)", "sauropodomorphesBasaux(plateosaurus)", "sauropodomorphesBasaux(massospondylus)",
    "sauropodesBasaux(mamenchisaurus)", "sauropodesBasaux(omeisaurus)", "sauropodesBasaux(shunosaurus)",
    "diplodocoidea(diplodocus)", "diplodocoidea(apatosaurus)", "diplodocoidea(amargasaurus)",
    "macronaria(brachiosaurus)", "macronaria(camarasaurus)", "macronaria(ampelosaurus)",
    "heterodontosauridae(heterodontosaurus)", "heterodontosauridae(abrictosaurus)",
    "thyreophoresBasaux(scelidosaurus)", "thyreophoresBasaux(scutellosaurus)",
    "stegosauria(stegosaurus)", "stegosauria(kentrosaurus)", "stegosauria(huayangosaurus)",
    "ankylosauria(euoplocephalus)", "ankylosauria(edmontonia)", "ankylosauria(ankylosaurus)",
    "pachycephalosauria(prenocephale)", "pachycephalosauria(pachycephalosaurus)", "pachycephalosauria(stegoceras)",
    "ceratopsia(triceratops)", "ceratopsia(protoceratops)", "ceratopsia(torosaurus)",
    "ornithopodesBasaux(hypsilophodon)", "ornithopodesBasaux(agilisaurus)", "ornithopodesBasaux(leaellynasaura)",
    "iguanodontia(iguanodon)", "iguanodontia(edmontosaurus)", "iguanodontia(parasaurolophus)"
]
for fact in facts:
    kb.add_fact(fact)

# Ajout des règles
rules = [
    (("ornithischia(X)"), "dinosaure(X)"),
    (("saurischia(X)"), "dinosaure(X)"),
    (("iguanodontia(X)"), "ornithopoda(X)"),
    (("ornithopodesBasaux(X)"), "ornithopoda(X)"),
    (("ceratopsia(X)"), "marginocephalia(X)"),
    (("pachycephalosauria(X)"), "marginocephalia(X)"),
    (("ornithopoda(X)"), "cerapoda(X)"),
    (("marginocephalia(X)"), "cerapoda(X)"),
    (("ankylosauria(X)"), "eurypoda(X)"),
    (("stegosauria(X)"), "eurypoda(X)"),
    (("eurypoda(X)"), "thyreophora(X)"),
    (("thyreophoresBasaux(X)"), "thyreophora(X)"),
    (("cerapoda(X)"), "genasauria(X)"),
    (("thyreophora(X)"), "genasauria(X)"),
    (("genasauria(X)"), "ornithischia(X)"),
    (("heterodontosauridae(X)"), "ornithischia(X)"),
    (("macronaria(X)"), "neosauropoda(X)"),
    (("diplodocoidea(X)"), "neosauropoda(X)"),
    (("neosauropoda(X)"), "sauropoda(X)"),
    (("sauropodesBasaux(X)"), "sauropoda(X)"),
    (("sauropoda(X)"), "sauropodomorpha(X)"),
    (("sauropodomorphesBasaux(X)"), "sauropodomorpha(X)"),
    (("avetheropoda(X)"), "tetanurae(X)"),
    (("megalosauroidea(X)"), "tetanurae(X)"),
    (("tetanurae(X)"), "neotheropoda(X)"),
    (("ceratosauria(X)"), "neotheropoda(X)"),
    (("neotheropoda(X)"), "theropoda(X)"),
    (("coelophysoidea(X)"), "theropoda(X)"),
    (("sauropodomorpha(X)"), "saurischia(X)"),
    (("theropoda(X)"), "saurischia(X)"),
    (("herrerasauridae(X)"), "saurischia(X)")
]
for condition, conclusion in rules:
    kb.add_rule(condition, conclusion)

# Exemple de raisonnement
kb.forward_chaining()

# Vérification d'un but
goal = "dinosaure(tyrannosaurus)"
if kb.backward_chaining(goal):
    print(f"{goal} est vrai.")
else:
    print(f"{goal} est faux.")

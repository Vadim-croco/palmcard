//
//  DictionaryViewModel.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 20.03.2023.
//

import Foundation

class DictionaryViewModel: ObservableObject {
    @Published var dictionaries: [DictionaryModel] = [
        DictionaryModel(name: "First", words: [
            WordsModel(name: "modern", translate: "современный", transcription: "ma:dern"),
            WordsModel(name: "gorgeous", translate: "великолепный, прекрасный", transcription: "go:rdзes горджес"),
            WordsModel(name: "catch someone off guard", translate: "застать кого-нибудь врасплох", examples: "you catch me off guard"),
            WordsModel(name: "impress", translate: "впечатлять", examples: "im not impressed"),
            WordsModel(name: "afford", translate: "позволить себе, достовлять", transcription: "afo:rd"),
            WordsModel(name: "acquaint", translate: "знакомить, познакомить", transcription: "ekweint"),
            WordsModel(name: "to be worth", translate: "быть достойным", transcription: "wo:rth"),
            WordsModel(name: "afford pleasure to smb", translate: "доставить удовольствие кому-то"),
            WordsModel(name: "get acquainted", translate: "познамиться", transcription: "ekweinted"),
            WordsModel(name: "break up with", translate: "расстаться с кем-то"),
            WordsModel(name: "especially", translate: "особенно", transcription: "ispeSeli эспешели"),
            WordsModel(name: "promise", translate: "обещать, дать слово", transcription: "pra:mis"),
            WordsModel(name: "to be addicted to", translate: "быть зависимым от чего-то"),
            WordsModel(name: "treat", translate: "относиться", examples: "treat me like a promise", transcription: "tri:t"),
            WordsModel(name: "pressure", translate: "давление, напряжение", transcription: "preSer"),
            WordsModel(name: "surgery", translate: "хирургия", examples: "he had surgery", transcription: "sёrdЗeri сёрджери"),
            WordsModel(name: "clearly", translate: "ясно, очетливо", transcription: "clirli"),
            WordsModel(name: "belong", translate: "принадлежать, относиться", transcription: "bilo:ŋ"),
            WordsModel(name: "wipe", translate: "вытирать, протирать, салфетка", transcription: "waip"),
            WordsModel(name: "fall apart", translate: "разваливаться на части"),
            WordsModel(name: "breakdown", translate: "поломка, разрушение"),
            WordsModel(name: "pull someone apart", translate: "разлучить кого-то", examples: "you pull us apart"),
            WordsModel(name: "preparatory", translate: "подготовительный", transcription: "pripæreto:ri"),
            WordsModel(name: "ever since", translate: "с тех пор"),
            WordsModel(name: "pour", translate: "наливать, проливать", transcription: "pu:r"),
            WordsModel(name: "literally", translate: "буквально, фактически", transcription: "litereli")
        ]),
        
        DictionaryModel(name: "Second", words: [
            WordsModel(name: "rather", translate: "довольно, скорее", examples: "im rather good at it", transcription: "ræther"),
            WordsModel(name: "violent", translate: "жестокий", transcription: "vaielent вайэлент"),
            WordsModel(name: "glisten", translate: "блестеть, сверкать", examples: "it glistens", transcription: "glisn"),
            WordsModel(name: "contagious", translate: "заразный", transcription: "lenteidзes кантейджес"),
            WordsModel(name: "get smth out", translate: "вытащить", examples: "u can get the world out me"),
            WordsModel(name: "to be suprised at", translate: "быть удивленным чему-то"),
            WordsModel(name: "mad about", translate: "злиться на кого-то"),
            WordsModel(name: "on purpose", translate: "намерено, специально", examples: "i do it on purpose"),
            WordsModel(name: "as well", translate: "также"),
            WordsModel(name: "to be offended by", translate: "обидеться на кого-то", examples: "is he offended by you?", translateExamples: "он обижет на тебя?"),
            WordsModel(name: "one-hit-wonder", translate: "автор одного хита"),
            WordsModel(name: "lizard", translate: "ящерица", transcription: "lixerd лизерд"),
            WordsModel(name: "flawless", translate: "безупречно", transcription: "flo:les флооолес"),
            WordsModel(name: "in paricular", translate: "в особенности, в частности", transcription: "partikleler партчекюлар"),
            WordsModel(name: "report", translate: "сообщить что-то плохое", examples: "he can report bout me to my school", transcription: "ripo:rt"),
            WordsModel(name: "most difinitely", translate: "определенно", transcription: "definetli дафинетли"),
            WordsModel(name: "perfomance", translate: "выступление", transcription: "perfo:rmens перфоменс"),
            WordsModel(name: "tear", translate: "слеза", examples: "it broughts tears to my eyes", transcription: "ter тер"),
            WordsModel(name: "pleasure", translate: "удовольствие", transcription: "pleЗer плежер"),
            WordsModel(name: "shrimp", translate: "креветка", transcription: "Shrimp чщримп"),
            WordsModel(name: "cross my mind", translate: "приходить на ум", examples: "leaving you never cross my mind", transcription: "kro:s mai maind"),
            WordsModel(name: "creature", translate: "существо", transcription: "kri:tчer критчер"),
            WordsModel(name: "trunk", translate: "багажник", transcription: "traŋk транк"),
            WordsModel(name: "tool", translate: "инструмент", transcription: "tu:l"),
            WordsModel(name: "hold (on)", translate: "удерживать, держаться за что-то"),
            WordsModel(name: "over here", translate: "вот тут"),
            WordsModel(name: "over there", translate: "вот там"),
            WordsModel(name: "for all of the things", translate: "за все то", examples: "for all of the things i put you through", transcription: "thiŋs"),
            WordsModel(name: "apologize", translate: "извиняться, просить прощение", transcription: "epailedзaiz эколоджайз"),
            WordsModel(name: "ability", translate: "способность"),
            WordsModel(name: "to be satisfied with", translate: "быть довольным чем-то", transcription: "sætisfied сатисфаед"),
            WordsModel(name: "anger", translate: "гнев", transcription: "æŋger энгер"),
            WordsModel(name: "powerfull", translate: "сильный", examples: "your shrimp is more powerfull than mine", transcription: "paverfl паверфл"),
            WordsModel(name: "meds", translate: "лекарства", examples: "i give my meds up"),
            WordsModel(name: "drummer", translate: "барабанщик, ударник", transcription: "dramer драмер"),
            WordsModel(name: "wacked, wack", translate: "чокнутый, псих", transcription: "wækt"),
            WordsModel(name: "tear smth up", translate: "порвать что-нибудь на части"),
            WordsModel(name: "talk on and on", translate: "говорить без остановки", transcription: "to:k"),
            WordsModel(name: "congratulate", translate: "поздравлять, поздравление", transcription: "lengrætSuleit конграчулейт"),
            WordsModel(name: "feed my needs", translate: "удовлетворить мои потребности"),
            WordsModel(name: "punch", translate: "удар с кулака", transcription: "pantS панчщ"),
            WordsModel(name: "mince", translate: "фарш, рубить, измельчать", examples: "im eating spaghetti with mince", transcription: "mins"),
            WordsModel(name: "mistreat", translate: "плохо общаться", transcription: "mistri:t"),
            WordsModel(name: "to be leave on", translate: "быть в отпуске", examples: "im leave on first of the august"),
            WordsModel(name: "to be interested in", translate: "быть заинтересованным в", transcription: "intrestid интерстед"),
            WordsModel(name: "deserve", translate: "заслужить", transcription: "di:zerv дизерв"),
            WordsModel(name: "umbrella", translate: "зонт", transcription: "ambrela"),
            WordsModel(name: "get smth booked", translate: "забронировать что-нибудь", transcription: "bukt букт"),
            WordsModel(name: "quite", translate: "довольно, хватит", transcription: "kwait"),
            WordsModel(name: "as it is known", translate: "как известно"),
            WordsModel(name: "on foot", translate: "пешком"),
            WordsModel(name: "happen", translate: "случаться, случайно", examples: "do you happen to know who is it?", translateExamples: "ты случайно не знаешь кто это?", transcription: "hæpen хапен"),
            WordsModel(name: "on my own", translate: "один, одного, самостоятельно", examples: "you left me on my own"),
            WordsModel(name: "tough", translate: "жесткий, трудный", examples: "this is tough lobby", transcription: "taf таф"),
            WordsModel(name: "lose", translate: "избавиться", examples: "i just wanna lose cold heart", transcription: "lu:z"),
            WordsModel(name: "turn smth down", translate: "отказать кому-то, чему-то", examples: "you turn me down", transcription: "тёрн"),
            WordsModel(name: "naughty", translate: "непослушный", transcription: "nati"),
            WordsModel(name: "fuss", translate: "суета", transcription: "fas"),
            WordsModel(name: "the worst", translate: "худший", transcription: "wo:rst"),
            WordsModel(name: "at first sight", translate: "с первого взгляда", transcription: "sait"),
            WordsModel(name: "at my disposal", translate: "в моем распоряжении", examples: "i have a wonderful day at my disposal" , transcription: "dispozal"),
            WordsModel(name: "blame, fault", translate: "винить, обвинять"),
            WordsModel(name: "on the one hand, on the other hand", translate: "с одной стороны, но с другой стороны", examples: "one the one hand i love to be home but on the other hand its going boring", transcription: "hænd"),
            WordsModel(name: "be wrong for", translate: "ошибаться из-за чего-то", transcription: "ro:ŋ"),
            WordsModel(name: "as if", translate: "как будто"),
            WordsModel(name: "ambulance", translate: "скорая помощь", transcription: "æmbelens амбьюленс"),
            WordsModel(name: "trick", translate: "уловка, трюк, обмануть"),
            WordsModel(name: "lap", translate: "колено", transcription: "læp"),
            WordsModel(name: "patience", translate: "терпение", transcription: "peiSns пейшнс"),
            WordsModel(name: "invention", translate: "изобретение", transcription: "invenSn инвеншн"),
            WordsModel(name: "hurry up", translate: "скорее"),
            WordsModel(name: "keep it real", translate: "быть реалистом"),
            WordsModel(name: "boast, brag about", translate: "хвастаться чем-то", transcription: "btæg"),
            WordsModel(name: "beast", translate: "зверь"),
            WordsModel(name: "squeeze", translate: "сжимать", examples: "im squeezing that bitch like im squeezing that bitch", transcription: "skwi:z"),
            WordsModel(name: "plunger", translate: "вантуз", transcription: "plandЗer планджер"),
            WordsModel(name: "to be caught up with", translate: "по уши увяз в", transcription: "ko:t"),
            WordsModel(name: "kind of you", translate: "любезно с вашей стороны"),
            WordsModel(name: "jail", translate: "тюрьма", transcription: "dзeil"),
            WordsModel(name: "give smth up", translate: "отказаться от чего-то"),
            WordsModel(name: "have smth enough", translate: "хватать чего-нибудь", examples: "i didnt have paper enough"),
            WordsModel(name: "effort", translate: "усилие", transcription: "афёрт"),
            WordsModel(name: "wish for", translate: "желать что-то"),
            WordsModel(name: "get fed up", translate: "сыт по горло"),
            WordsModel(name: "clean smth up", translate: "убрать, очистить что-то"),
            WordsModel(name: "stare", translate: "глазеть, пялиться", transcription: "ster"),
            WordsModel(name: "it dont mean shit", translate: "это нихрена не значит", transcription: "mi:n"),
            WordsModel(name: "spit", translate: "плевать", transcription: "spit"),
            WordsModel(name: "arrive", translate: "приезжать", transcription: "eraiv"),
            WordsModel(name: "chosen", translate: "выбранный", examples: "who been chosen it with me?", transcription: "чоузен"),
            WordsModel(name: "overseas, abroad", translate: "за границей"),
            WordsModel(name: "on the whole", translate: "в целом"),
            WordsModel(name: "to be afraid of", translate: "боятся чего-либо")
            
        ])
    ] {
        didSet {
            saveDictionaries()
        }
    }
    
    private let dictionariesKey: String = "dictionaries"
    private let selectDictionaryKey: String = "selectDictionary"
    
    init(){
        if let data = UserDefaults.standard.data(forKey: dictionariesKey) {
            let savedItems = try? JSONDecoder().decode([DictionaryModel].self, from: data)
                if let takeSavedItems = savedItems {
                    self.dictionaries = takeSavedItems
                }
        }
    }
    
    func getName(id: String) -> String {
        if let item = dictionaries.first(where: {$0.id == id}) {
            return item.name
        } else {
            return "Error"
        }
    }
    
    func getListWord(id: String) -> [WordsModel] {
        if let item = dictionaries.first(where: {$0.id == id}) {
            return item.words
        } else {
            return []
        }
    }
    
    func getWordName(idDictionary: String, idWord: String) -> String {
        if let dictionary = dictionaries.first(where: {$0.id == idDictionary}) {
            if let word = dictionary.words.first(where: {$0.id == idWord}) {
                return word.name
            } else {
                return "Word dont found"
            }
        } else {
            return "Dictionary dont found"
        }
    }
    
    func getWordTranslate(idDictionary: String, idWord: String) -> String {
        if let dictionary = dictionaries.first(where: {$0.id == idDictionary}) {
            if let word = dictionary.words.first(where: {$0.id == idWord}) {
                return word.translate
            } else {
                return "Word dont found"
            }
        } else {
            return "Dictionary dont found"
        }
    }
    
    func getWordTranscription(idDictionary: String, idWord: String) -> String {
        if let dictionary = dictionaries.first(where: {$0.id == idDictionary}) {
            if let word = dictionary.words.first(where: {$0.id == idWord}) {
                return word.transcription
            } else {
                return "Word dont found"
            }
        } else {
            return "Dictionary dont found"
        }
    }
    
    func getWordExamples(idDictionary: String, idWord: String) -> String {
        if let dictionary = dictionaries.first(where: {$0.id == idDictionary}) {
            if let word = dictionary.words.first(where: {$0.id == idWord}) {
                return word.examples
            } else {
                return "Word dont found"
            }
        } else {
            return "Dictionary dont found"
        }
    }
    
    func getWordTranslateExamples(idDictionary: String, idWord: String) -> String {
        if let dictionary = dictionaries.first(where: {$0.id == idDictionary}) {
            if let word = dictionary.words.first(where: {$0.id == idWord}) {
                return word.translateExamples
            } else {
                return "Word dont found"
            }
        } else {
            return "Dictionary dont found"
        }
    }
    
    func getModelWord(idDictionary: String, idWord: String) -> WordsModel {
        if let dictionary = dictionaries.first(where: {$0.id == idDictionary}) {
            if let word = dictionary.words.first(where: {$0.id == idWord}) {
                return word
            } else {
                return WordsModel(name: "Word dont found", translate: "word dont found")
            }
        } else {
            return WordsModel(name: "Dictionary dont found", translate: "Dictionary dont found")
        }
    }
    
    func replaceWordToAnotherDictionary(idThisDictionary: String, idToDictionary: String, idWord: String) {
        if let thisDictionaryIndex = dictionaries.firstIndex(where: {$0.id == idThisDictionary}) {
            if let word = dictionaries[thisDictionaryIndex].words.first(where: {$0.id == idWord}) {
                if let index = dictionaries.firstIndex(where: {$0.id == idToDictionary}) {
                    dictionaries[index].words.append(word)
                    dictionaries[thisDictionaryIndex].words = dictionaries[thisDictionaryIndex].words.filter{$0.id != word.id}
                }
            }
        }
    }
    
    func renameDictionary(newName: String, id: String){
        if let index = dictionaries.firstIndex(where: {$0.id == id}) {
            dictionaries[index].name = newName.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    
    func renameWord(newName: String, newTranslate: String, newTrancription: String, newExamples: String, newTranslateExamples: String, idDictionary: String, idWord: String) {
        if let indexDictionary = dictionaries.firstIndex(where: {$0.id == idDictionary}) {
            if let indexWord = dictionaries[indexDictionary].words.firstIndex(where: {$0.id == idWord}) {
                dictionaries[indexDictionary].words[indexWord].name = newName.trimmingCharacters(in: .whitespacesAndNewlines)
                dictionaries[indexDictionary].words[indexWord].translate = newTranslate.trimmingCharacters(in: .whitespacesAndNewlines)
                dictionaries[indexDictionary].words[indexWord].transcription = newTrancription.trimmingCharacters(in: .whitespacesAndNewlines)
                dictionaries[indexDictionary].words[indexWord].examples = newExamples.trimmingCharacters(in: .whitespacesAndNewlines)
                dictionaries[indexDictionary].words[indexWord].translateExamples = newTranslateExamples.trimmingCharacters(in: .whitespacesAndNewlines)
            }
        }

    }
    
    func addDictionary(name: String) {
        dictionaries.insert(DictionaryModel(name: name), at: 0)
    }
    
    func addWords(name: String, translate: String, transcription: String, examples: String, translateExamples: String, id: String) {
        if let index = dictionaries.firstIndex(where: {$0.id == id}) {
            dictionaries[index].words.insert(
                WordsModel(
                    name: name,
                    translate: translate,
                    examples: examples,
                    translateExamples: translateExamples,
                    transcription: transcription
            ), at: 0)
        }
    }
    
    func deleteDictionary(indexSet: IndexSet) {
        dictionaries.remove(atOffsets: indexSet)
    }
    
    func deleteWord(indexSet: IndexSet, id: String) {
        if let index = dictionaries.firstIndex(where: {$0.id == id}) {
            dictionaries[index].words.remove(atOffsets: indexSet)
        }
    }
    
    func moveDictionary(from: IndexSet, to: Int) {
        dictionaries.move(fromOffsets: from, toOffset: to)
    }
    
    func moveWord(from: IndexSet, to: Int, id: String) {
        if let index = dictionaries.firstIndex(where: {$0.id == id}) {
            dictionaries[index].words.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func saveDictionaries() {
        if let encodingData = try? JSONEncoder().encode(dictionaries) {
            UserDefaults.standard.set(encodingData, forKey: dictionariesKey)
        }
    }
}

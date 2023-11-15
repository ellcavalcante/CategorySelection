//
//  SearchViewController.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 21/09/23.
//

protocol SearchViewControllerDelegate: AnyObject {
    func pressBotaoFiltrar(withJSONData jsonData: Data?)
}

import UIKit

class SearchViewController: UIViewController {
    
    weak var delegate: SearchViewControllerDelegate?
    
    var screen: SearchScreen?
    var brandSelectedItems: [ItemModel] = []
    var engineSelectedItems: [DataModel] = []
    var yearSelectedItems: [DataModel] = []
    var colorSelectedItems: [DataModel] = []
    
    var arrayToPass: [ItemModel] = [ItemModel(name: "Toyota", id: 1, modelos:
                                                [Modelos(id: 101, name: "Corolla", releaseYear: 1966, engine: "4 Cilindros"),
                                                 Modelos(id: 102, name: "Camry", releaseYear: 1982, engine: "V6"),
                                                 Modelos(id: 103, name: "Rav4", releaseYear: 1994, engine: "4 Cilindros"),
                                                 Modelos(id: 104, name: "Highlander", releaseYear: 2001, engine: "V6"),
                                                 Modelos(id: 105, name: "Prius", releaseYear: 1997, engine: "Híbrido"),
                                                 Modelos(id: 106, name: "Corolla Cross", releaseYear: 2020, engine: "4 Cilindros"),
                                                 Modelos(id: 107, name: "C-HR", releaseYear: 2016, engine: "4 Cilindros"),
                                                 Modelos(id: 108, name: "Land Cruiser", releaseYear: 1951, engine: "V8"),
                                                 Modelos(id: 109, name: "Yaris", releaseYear: 1999, engine: "4 Cilindros"),
                                                 Modelos(id: 110, name: "Tacoma", releaseYear: 1995, engine: "V6")]),
                                    
                                    ItemModel(name: "Ford", id: 2, modelos:
                                                [Modelos(id: 201, name: "F-150", releaseYear: 1975, engine: "V6"),
                                                 Modelos(id: 202, name: "Mustang", releaseYear: 1964, engine: "V8"),
                                                 Modelos(id: 203, name: "Explorer", releaseYear: 1990, engine: "4 Cilindros"),
                                                 Modelos(id: 204, name: "Escape", releaseYear: 2000, engine: "4 Cilindros"),
                                                 Modelos(id: 205, name: "Edge", releaseYear: 2006, engine: "V6"),
                                                 Modelos(id: 206, name: "Focus", releaseYear: 1998, engine: "4 Cilindros"),
                                                 Modelos(id: 207, name: "Expedition", releaseYear: 1996, engine: "V8"),
                                                 Modelos(id: 208, name: "Fiesta", releaseYear: 1976, engine: "4 Cilindros"),
                                                 Modelos(id: 209, name: "Ranger", releaseYear: 1983, engine: "4 Cilindros"),
                                                 Modelos(id: 210, name: "Bronco", releaseYear: 1965, engine: "V6")]),
                                    
                                    ItemModel(name: "Volkswagen", id: 3, modelos:
                                                [Modelos(id: 301, name: "Golf", releaseYear: 1974, engine: "4 Cilindros"),
                                                 Modelos(id: 302, name: "Passat", releaseYear: 1973, engine: "4 Cilindros"),
                                                 Modelos(id: 303, name: "Tiguan", releaseYear: 2007, engine: "4 Cilindros"),
                                                 Modelos(id: 304, name: "Jetta", releaseYear: 1979, engine: "4 Cilindros"),
                                                 Modelos(id: 305, name: "Atlas", releaseYear: 2017, engine: "V6"),
                                                 Modelos(id: 306, name: "Arteon", releaseYear: 2017, engine: "4 Cilindros"),
                                                 Modelos(id: 307, name: "Polo", releaseYear: 1975, engine: "4 Cilindros"),
                                                 Modelos(id: 308, name: "Taos", releaseYear: 2020, engine: "4 Cilindros"),
                                                 Modelos(id: 309, name: "ID.3", releaseYear: 2020, engine: "Elétrico"),
                                                 Modelos(id: 310, name: "Touareg", releaseYear: 2002, engine: "V6")]),
                                    
                                    ItemModel(name: "Honda", id: 4, modelos:
                                                [Modelos(id: 401, name: "Civic", releaseYear: 1972, engine: "4 Cilindros"),
                                                 Modelos(id: 402, name: "Accord", releaseYear: 1976, engine: "4 Cilindros"),
                                                 Modelos(id: 403, name: "CR-V", releaseYear: 1995, engine: "4 Cilindros"),
                                                 Modelos(id: 404, name: "Fit", releaseYear: 2001, engine: "4 Cilindros"),
                                                 Modelos(id: 405, name: "Pilot", releaseYear: 2002, engine: "V6"),
                                                 Modelos(id: 406, name: "HR-V", releaseYear: 1998, engine: "4 Cilindros"),
                                                 Modelos(id: 407, name: "Odyssey", releaseYear: 1994, engine: "V6")])]
    
    var arrayColorTest: [ColorModel] = [ColorModel(nameColor: "Branco"),
                                        ColorModel(nameColor: "Preto"),
                                        ColorModel(nameColor: "Prata"),
                                        ColorModel(nameColor: "Cinza"),
                                        ColorModel(nameColor: "Azul"),
                                        ColorModel(nameColor: "Vermelho"),
                                        ColorModel(nameColor: "Verde"),
                                        ColorModel(nameColor: "Amarelo"),
                                        ColorModel(nameColor: "Laranja"),
                                        ColorModel(nameColor: "Marrom")]
    
    override func loadView() {
        screen = SearchScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
        screen?.configTextFieldDelegate(delegate: self)
        settings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func settings() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let tapBrandView = UITapGestureRecognizer(target: self, action: #selector(brandViewTapped))
        screen?.brandView.addGestureRecognizer(tapBrandView)
        
        let tapEngineView = UITapGestureRecognizer(target: self, action: #selector(engineViewTapped))
        screen?.engineView.addGestureRecognizer(tapEngineView)
        
        let tapYearView = UITapGestureRecognizer(target: self, action: #selector(yearViewTapped))
        screen?.yearView.addGestureRecognizer(tapYearView)
        
        let tapColorView = UITapGestureRecognizer(target: self, action: #selector(colorViewTapped))
        screen?.colorView.addGestureRecognizer(tapColorView)
    }
    
    @objc func brandViewTapped() {
        let dataArray = arrayToPass.map { marca in
            DataModel(id: marca.id, nome: marca.name)
        }
        
        let marcasSelecionadas = brandSelectedItems.map { marca in
            DataModel(id: marca.id, nome: marca.name)
        }
        
        let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.brandTitleLabel.text ?? "", dataArray: dataArray, selectedItems: marcasSelecionadas)
        screenCategories.delegate = self
        self.navigationController?.pushViewController(screenCategories, animated: true)
    }
    
    @objc func engineViewTapped() {
        guard !brandSelectedItems.isEmpty else {
            let alertController = UIAlertController(
                title: " ATENÇÃO ",
                message: "Você deve selecionar uma marca antes de selecionar o motor.",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        var dataMotorSelect: [String] = []
        
        for marca in brandSelectedItems {
            for modelo in marca.modelos {
                if !dataMotorSelect.contains(where: { model in
                    modelo.engine == model
                }) {
                    dataMotorSelect.append(modelo.engine)
                }
            }
        }
        
        let listaDeMotoresSelecionados = dataMotorSelect.enumerated().map { index, engine in
            DataModel(id: index, nome: engine)
        }
        
        let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.engineTitleLabel.text ?? "", dataArray: listaDeMotoresSelecionados, selectedItems: engineSelectedItems)
        screenCategories.delegate = self
        self.navigationController?.pushViewController(screenCategories, animated: true)
    }
    
    @objc func yearViewTapped() {
        guard !brandSelectedItems.isEmpty else {
            let alertController = UIAlertController(
                title: " ATENÇÃO ",
                message: "Você deve selecionar uma marca antes de selecionar o ano.",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        var dataYear: [String] = []
        
        for marca in brandSelectedItems {
            for ano in marca.modelos {
                if !dataYear.contains(where: { model in
                    String(ano.releaseYear) == model
                }) {
                    dataYear.append(String(ano.releaseYear))
                }
            }
        }
        
        var listaDeAnos: [DataModel] = []
        
        listaDeAnos = dataYear.enumerated().map { index, ano in
            let updatedYear = ano.hasSuffix("0") ? ano : String(ano.dropLast()) + "0"
            return updatedYear
        }
        .uniqued()
        .enumerated()
        .map { index, updatedYear in
            return DataModel(id: index, nome: updatedYear)
        }
        
        let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.yearTitleLabel.text ?? "", dataArray: listaDeAnos, selectedItems: yearSelectedItems)
        screenCategories.delegate = self
        self.navigationController?.pushViewController(screenCategories, animated: true)
    }
    
    @objc func colorViewTapped() {
        
        var dataColor: [String] = []
        for cor in arrayColorTest {
            dataColor.append(cor.nameColor)
        }
        
        let dataColorModel = dataColor.enumerated().map { index, color in
            DataModel(id: index, nome: color)
        }
        
        let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.colorTitleLabel.text ?? "", dataArray: dataColorModel, selectedItems: colorSelectedItems)
        screenCategories.delegate = self
        self.navigationController?.pushViewController(screenCategories, animated: true)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension SearchViewController: CategoriesViewControllerDelegate {
    
    func didSelectItems(_ selectedItems: [DataModel], forCategory category: String) {
        
        if category == screen?.brandTitleLabel.text {
            let marcasSelecionadas = arrayToPass.filter { marca in
                selectedItems.contains { model in
                    marca.id == model.id
                }
            }
            brandSelectedItems = marcasSelecionadas
            
            if marcasSelecionadas.isEmpty {
                let attributedText = NSMutableAttributedString(string: "Filtrar por marca")
                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 12),
                    .foregroundColor: UIColor.systemGray,
                ]
                attributedText.addAttributes(attributes, range: NSRange(location: 0, length: attributedText.length))
                screen?.brandLabel.attributedText = attributedText
                screen?.pencilBrandButton.isHidden = true
            } else {
                let selectedItemsText = marcasSelecionadas.map { $0.name }.joined(separator: "\n\n")
                screen?.brandLabel.text = selectedItemsText
                screen?.brandLabel.textColor = UIColor.black
                screen?.pencilBrandButton.isHidden = false
            }
        }
        
        if category == screen?.engineTitleLabel.text {
            var engineList: [String] = []
            for engine in brandSelectedItems {
                for motor in engine.modelos {
                    engineList.append(motor.engine)
                }
            }
            
            let transformEngine = engineList.enumerated().map { index, engine in
                DataModel(id: index, nome: engine)
            }
            
            let motoresSelecionadas = transformEngine.filter { engine in
                selectedItems.contains { model in
                    engine.id == model.id
                }
            }
            
            engineSelectedItems = motoresSelecionadas
            
            if selectedItems.isEmpty {
                let attributedText = NSMutableAttributedString(string: "Filtrar por motor")
                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 12),
                    .foregroundColor: UIColor.systemGray,
                ]
                attributedText.addAttributes(attributes, range: NSRange(location: 0, length: attributedText.length))
                screen?.engineLabel.attributedText = attributedText
                screen?.pencilEngineButton.isHidden = true
            } else {
                let selectedItemsText = selectedItems.map { $0.nome }.joined(separator: "\n\n")
                screen?.engineLabel.text = selectedItemsText
                screen?.engineLabel.textColor = UIColor.black
                screen?.pencilEngineButton.isHidden = false
            }
        }
        
        if category == screen?.yearTitleLabel.text {
            var yearList: [String] = []
            for year in brandSelectedItems {
                for ano in year.modelos {
                    yearList.append(String(ano.releaseYear))
                }
            }
            
            let transformYear = yearList.enumerated().map { index, year in
                DataModel(id: index, nome: year)
            }
            
            let yearSelecionados = transformYear.filter { ano in
                selectedItems.contains { model in
                    ano.id == model.id
                }
            }
            
            yearSelectedItems = yearSelecionados
            
            if selectedItems.isEmpty {
                let attributedText = NSMutableAttributedString(string: "Filtrar por ano")
                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 12),
                    .foregroundColor: UIColor.systemGray,
                ]
                attributedText.addAttributes(attributes, range: NSRange(location: 0, length: attributedText.length))
                screen?.yearLabel.attributedText = attributedText
                screen?.pencilYearButton.isHidden = true
            } else {
                let selectedItemsText = selectedItems.map { $0.nome }.joined(separator: "\n\n")
                screen?.yearLabel.text = selectedItemsText
                screen?.yearLabel.textColor = UIColor.black
                screen?.pencilYearButton.isHidden = false
            }
        }
        
        if category == screen?.colorTitleLabel.text {
            var color: [String] = []
            for cor in arrayColorTest {
                color.append(cor.nameColor)
            }
            
            let transformColor = color.enumerated().map { index, color in
                DataModel(id: index, nome: color)
            }
            
            let coresSelecionadas = transformColor.filter { cor in
                selectedItems.contains { model in
                    cor.id == model.id
                }
            }
            
            colorSelectedItems = coresSelecionadas
            
            if selectedItems.isEmpty {
                let attributedText = NSMutableAttributedString(string: "Filtrar por cor")
                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 12),
                    .foregroundColor: UIColor.systemGray,
                ]
                attributedText.addAttributes(attributes, range: NSRange(location: 0, length: attributedText.length))
                screen?.colorLabel.attributedText = attributedText
                screen?.pencilColorButton.isHidden = true
            } else {
                let selectedItemsText = selectedItems.map { $0.nome }.joined(separator: "\n\n")
                screen?.colorLabel.text = selectedItemsText
                screen?.colorLabel.textColor = UIColor.black
                screen?.pencilColorButton.isHidden = false
            }
        }
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension SearchViewController: SearchScreenProtocol  {
    
    func actionFilterButton() {
        print("Botão pressionado")
        let jsonData = generateJSONData()
        delegate?.pressBotaoFiltrar(withJSONData: jsonData)
        navigationController?.popViewController(animated: true)
    }
    
    func actionCleanButton() {
        //atributos do campo marca
        let attributedBrandText = NSMutableAttributedString(string: "Filtrar por marca")
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.systemGray,
        ]
        attributedBrandText.addAttributes(attributes, range: NSRange(location: 0, length: attributedBrandText.length))
        didSelectItems([], forCategory: "Marca")
        screen?.brandLabel.attributedText = attributedBrandText
        
        //atributos do campo motor
        let attributedEngineText = NSMutableAttributedString(string: "Filtrar por motor")
        let attributesEngine: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.systemGray,
        ]
        attributedEngineText.addAttributes(attributesEngine, range: NSRange(location: 0, length: attributedEngineText.length))
        didSelectItems([], forCategory: "Motor")
        screen?.engineLabel.attributedText = attributedEngineText
        
        //atributos do campo ano
        let attributedYearText = NSMutableAttributedString(string: "Filtrar por ano")
        let attributesYear: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.systemGray,
        ]
        attributedYearText.addAttributes(attributesYear, range: NSRange(location: 0, length: attributedYearText.length))
        didSelectItems([], forCategory: "Ano")
        screen?.yearLabel.attributedText = attributedYearText
        
        //atributos do campo cor
        let attributedColorText = NSMutableAttributedString(string: "Filtrar por cor")
        let attributesColor: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.systemGray,
        ]
        attributedColorText.addAttributes(attributesColor, range: NSRange(location: 0, length: attributedColorText.length))
        didSelectItems([], forCategory: "Cor")
        screen?.colorLabel.attributedText = attributedColorText
        
        //esconder o ícone de lapis
        screen?.pencilBrandButton.isHidden = true
        screen?.pencilEngineButton.isHidden = true
        screen?.pencilYearButton.isHidden = true
        screen?.pencilColorButton.isHidden = true
        
    }
    
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension SearchViewController {
    public func generateJSONData() -> Data? {
        let searchData = SearchData(search: (screen?.typeSomethingTextField.text?.isEmpty ?? true ? "null" : screen?.typeSomethingTextField.text) ?? "",
                                    advanced: AdvancedData(brand: brandSelectedItems.map { $0.id },
                                                           engine: engineSelectedItems.map { $0.nome },
                                                           year: yearSelectedItems.map { $0.nome },
                                                           color: colorSelectedItems.map { $0.nome }))
        do {
            let searchDataDictionary = [
                "search": searchData.search,
                "advanced": searchData.advanced.serializable
            ] as [String : Any]

            let jsonData = try JSONSerialization.data(withJSONObject: searchDataDictionary, options: .prettyPrinted)
            return jsonData
        } catch {
            print("Error encoding JSON: \(error)")
            return nil
        }
    }
}


extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var seen = Set<Element>()
        return filter { seen.insert($0).inserted }
    }
}


extension AdvancedData {
    var serializable: [String: Any] {
        return [
            "brand": brand,
            "engine": engine,
            "year": year,
            "color": color
        ]
    }
}

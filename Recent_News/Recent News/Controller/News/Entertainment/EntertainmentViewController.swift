//
//  EntertainmentViewController.swift
//  Recent News
//
//  Created by Filip  on 12.4.22..
//

import UIKit

class EntertainmentViewController: UIViewController {
    
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var trueButton: ShadowButton!
    @IBOutlet weak var falseButton: ShadowButton!
    @IBOutlet weak var questionText: UITextView!
    @IBOutlet weak var scoreTitle: UILabel!
    @IBOutlet weak var backgroundViewScore: UIView!
    @IBOutlet weak var backgroundViewQuestion: UIView!
    @IBOutlet weak var gameRulesButton: UIButton!
    
    let alertService = GameRulesService()

    static var identifier = "EntertainmentViewController"
    
    var jsonDataForQuiz: TriviaRoot?
    var questionIndex = 0
    var correctAnswer = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        getJsonData()
    }
    
    private func setupUI() {
        backgroundViewScore.layer.cornerRadius = 7
        questionText.layer.cornerRadius = 7
        backgroundViewQuestion.layer.cornerRadius = 7
        questionText.text = ""
        nextQuestion.setTitle("", for: .normal)
        nextQuestion.tintColor = .clear
        trueButton.tintColor = .systemGray
        falseButton.tintColor = .systemGray
    }
    
    func getJsonData() {
        
        let url = URL(string: "https://opentdb.com/api.php?amount=50&type=boolean")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(TriviaRoot.self, from: data)
                    
                    self.jsonDataForQuiz = jsonData
                    
                    
                    DispatchQueue.main.async {
                        
                        let question = self.jsonDataForQuiz?.results[self.questionIndex].question
                        
                        self.questionText.text = question?.replacingOccurrences(of: "&#039;s", with: " ")
                    }
                    
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    @IBAction func trueButtonPressed(_ sender: Any) {
        
        if self.trueButton.titleLabel?.text == self.jsonDataForQuiz?.results[questionIndex].correct_answer {
            
            correctAnswer += 1
            scoreTitle.text = "Score: \(correctAnswer)"
            trueButton.tintColor = .green
            nextQuestion.tintColor = .systemGray
            nextQuestion.setTitle("Next Question", for: .normal)
            
        } else {
            trueButton.tintColor = .red
            nextQuestion.tintColor = .clear
            
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(.error)
            
            let tryAgainAlert = UIAlertController(title: "Ooooups...!", message: "Your score is \(correctAnswer) correct answers in a row!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Try Again", style: .default) { [self] action in
                
                nextQuestion.reloadInputViews()
                trueButton.tintColor = .systemGray
                falseButton.tintColor = .systemGray
                questionIndex += 1
                questionText.text = self.jsonDataForQuiz?.results[questionIndex].question
                questionText.reloadInputViews()
            }
            scoreTitle.text = "Score: 0"
            correctAnswer = 0
            
            tryAgainAlert.addAction(action)
            present(tryAgainAlert, animated: true)
        }
    }
    
    @IBAction func falseButtonPressed(_ sender: Any) {
        
        if self.falseButton.titleLabel?.text == self.jsonDataForQuiz?.results[questionIndex].correct_answer {
            
            correctAnswer += 1
            scoreTitle.text = "Score: \(correctAnswer)"
            falseButton.tintColor = .green
            nextQuestion.tintColor = .systemGray
            nextQuestion.setTitle("Next Question", for: .normal)
            
            
        } else {
            falseButton.tintColor = .red
            nextQuestion.tintColor = .clear
            
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(.error)
            
            let tryAgainAlert = UIAlertController(title: "Ooooups...!", message: "Your score is \(correctAnswer) correct answers in a row", preferredStyle: .alert)
            let action = UIAlertAction(title: "Try Again", style: .default) { [self] action in
                
                nextQuestion.reloadInputViews()
                trueButton.tintColor = .systemGray
                falseButton.tintColor = .systemGray
                questionIndex += 1
                questionText.text = self.jsonDataForQuiz?.results[questionIndex].question
                questionText.reloadInputViews()
            }
            scoreTitle.text = "Score: 0"
            correctAnswer = 0
            
            tryAgainAlert.addAction(action)
            present(tryAgainAlert, animated: true)
        }
    }
    
    @IBAction func nextQuestionTapped(_ sender: Any) {
        
        nextQuestion.tintColor = .clear
        nextQuestion.setTitle("", for: .normal)
        
        if trueButton.tintColor == .systemGray && falseButton.tintColor == .systemGray {
            
            questionText.text = self.jsonDataForQuiz?.results[questionIndex].question
            
        } else {
            trueButton.tintColor = .systemGray
            falseButton.tintColor = .systemGray
            questionIndex += 1
            questionText.text = self.jsonDataForQuiz?.results[questionIndex].question
            questionText.reloadInputViews()
        }
    }
    
    @IBAction func gameRulesButtonTapped(_ sender: Any) {
        
       let alertVC = alertService.alert()
        
        present(alertVC, animated: true)
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

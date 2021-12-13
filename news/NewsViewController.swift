//
//  ViewController.swift
//  news
//
//  Created by Ruslan Sharshenov on 26.11.2021.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var news: [NewsModel] = []
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = news[indexPath.row]
        print(model.descriptions)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath ) as! NewsCell
        
        let model = news[indexPath.row]
        
        cell.newsTitle.text = model.title
        cell.newsDescriptions.text = model.descriptions
        cell.newsImage.image = UIImage(named: model.image)
        return cell
    }
    

    @IBOutlet weak var newsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        
        news.append(NewsModel(title: "Heroic сыграет с заменой на BLAST Premier: World Final 2021", desctiptions: "Аналитик Данкан Thorin Шилдс спародировал ответ сотрудника", image: "csGo4"))
        news.append(NewsModel(title: "Thorin об обвинениях Twitch в скрытии CS:GO из рекомендаций: «Нет, дело не в том, что мы в Twitch не любим CS:GO»", desctiptions: "рекомендуемых категорий и каналов на платформе. ", image: "csGo1"))
        news.append(NewsModel(title: "Virtus.pro и Team Vitality начнут IEM Katowice 2022 с группового этапа", desctiptions: "Ранее комментатор Алекс Mauisnake Элленберг рассказал, что ему оказалось сложно найти на новом аккаунте", image: "csGo2"))
        news.append(NewsModel(title: "ZywOo стал MVP на IEM Winter 2021 — это его первый титул в 2021 году", desctiptions: "Элленбергу ответил директор по продуктам Twitch Том Веррилли.", image: "csGo3"))
        news.append(NewsModel(title: "Team Vitality стала чемпионом IEM Winter 2021", desctiptions: " Он объяснил, что рекомендации для новых аккаунтов определяются", image: "csGo5"))
        
        
        newsTableView.dataSource = self
        newsTableView.delegate = self
    }
    @IBAction func DeleteButton(_ sender: UIButton) {
        news.removeFirst()
        news.removeLast()
        newsTableView.reloadData()
    }
    
    }
    


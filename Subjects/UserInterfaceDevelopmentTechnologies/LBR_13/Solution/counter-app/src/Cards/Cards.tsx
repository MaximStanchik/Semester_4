import { Card, Category } from "../Card"
import "./Cards.css"

type props = {
  cards: Card[]
}

export function Cards({cards} : props) {
  return (
    <div className="Cards">
      {cards.map(card => (
        <div className="Card" onClick={() => window.open(card.url, '_blank')}>
          <img src={card.image}/>
          <div className="Info">
            <h3 className="Title">{card.title}</h3>
            <div className="Keys">
              <h5>{card.year.toString()}</h5>
              <h5 className="Type">{Category[card.type]}</h5>
            </div>
          </div>
        </div>
      ))}
    </div>
  )
}

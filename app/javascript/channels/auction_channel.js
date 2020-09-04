import consumer from "./consumer";

const initAuctionCable = () => {
  const bidsContainer = document.getElementById('bids');
  const bidsCounter = document.getElementById('bids-counter');
  console.log(bidsContainer);
  console.log(bidsCounter);

  if (bidsContainer) {
    const id = bidsContainer.dataset.auctionId;
    console.log(id);
    console.log("i'm here")
    consumer.subscriptions.create({ channel: "AuctionChannel", id: id }, {
      received(data) {
        console.log(data[0]);
        bidsContainer.innerHTML = '';
        bidsContainer.insertAdjacentHTML('beforeend', data[0]);
      },
    });
  }
  if (bidsCounter) {
    const id = bidsCounter.dataset.auctionId;
    console.log(id);
    console.log("i'm there")
    consumer.subscriptions.create({ channel: "AuctionChannel", id: id }, {
      received(data) {
        console.log(data[1]);
        bidsCounter.innerHTML = '';
        bidsCounter.insertAdjacentHTML('beforeend', data[1]);
      },
    });
  }
}

export { initAuctionCable };

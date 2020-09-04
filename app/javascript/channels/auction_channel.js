import consumer from "./consumer";

const initAuctionCable = () => {
  const bidsContainer = document.getElementById('bids');
  if (bidsContainer) {
    const id = bidsContainer.dataset.auctionId;
    consumer.subscriptions.create({ channel: "AuctionChannel", id: id }, {
      received(data) {
        bidsContainer.innerHTML = '';
        bidsContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initAuctionCable };

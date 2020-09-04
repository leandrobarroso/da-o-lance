import consumer from "./consumer";

const initUserCable = () => {
  const auctionsIndex = document.getElementById('auctions-index');

  if (auctionsIndex) {
    const id = auctionsIndex.dataset.userId;

    consumer.subscriptions.create({ channel: "UserChannel", id: id }, {
      received(data) {
        auctionsIndex.innerHTML = '';
        auctionsIndex.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initUserCable };

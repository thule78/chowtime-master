const aisleDropdown = () => {
  let aisles = document.querySelectorAll('.aisle')
  aisles = Array.prototype.slice.call(aisles)
  let lists = document.querySelectorAll('.ingr-list')
  let carets = document.querySelectorAll('.down-caret')
  aisles.forEach((aisle) => {
    aisle.addEventListener('click', (event) => {
      if(lists[aisles.indexOf(aisle)].classList.value.split(" ").includes('d-none')) {
        lists[aisles.indexOf(aisle)].classList.remove('d-none');
        carets[aisles.indexOf(aisle)].innerHTML = "<i class='fas fa-caret-up'></i>";
      } else {
        lists[aisles.indexOf(aisle)].classList.add('d-none');
        carets[aisles.indexOf(aisle)].innerHTML = "<i class='fas fa-caret-down'></i></i>";
      };
      // i += 1;
    })
  })
}

const saveAisleIndex = (aisleIndex) => {
  return aisleIndex;
}

const checkAsPurchased = () => {
  let listItems = document.querySelectorAll('.list-item');
  listItems = Array.prototype.slice.call(listItems);
  let checkboxes = document.querySelectorAll('.form-check-input');
  let completedNum = document.querySelectorAll('.completed');
  let totalNum = document.querySelectorAll('.total');
  // let aisleIndex = 0;
  // let totalNumCounter = parseInt(totalNum[aisleIndex].innerText);
  listItems.forEach((item) => {
    const index = listItems.indexOf(item);
    // aisleIndex = item.dataset.aisleIndex
    if(checkboxes[index].checked === true) {
      item.classList.add('active');
    };
    // if(index === totalNumCounter) {
    //   aisleIndex += 1;
    //   totalNumCounter += parseInt(totalNum[aisleIndex].innerText);
    // };
    item.addEventListener('click', (event) => {
      const aisleIndex = parseInt(item.dataset.aisleIndex);
      const classes = Array.prototype.slice.call(item.classList);
      console.log(classes);
      console.log(aisleIndex);
      if(classes.includes('active')) {
        completedNum[aisleIndex].innerText = parseInt(completedNum[aisleIndex].innerText) + 1;
      } else {
        completedNum[aisleIndex].innerText = parseInt(completedNum[aisleIndex].innerText) - 1;
      };
      if(checkboxes[index].checked === true) {
        checkboxes[index].checked = false;
      } else {
        checkboxes[index].checked = true;
      };
    });
  });
}

export { aisleDropdown, checkAsPurchased };

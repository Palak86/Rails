import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "results", "category" ]

  connect() {
  }

  performSearch() {
    const query = this.inputTarget.value
    const categoryId = this.categoryTarget.value

    let url = "/products?"

    if (categoryId) {
      url += `category_id=${categoryId}&`
    }
    if (query) {
      url += `search=${encodeURIComponent(query)}`
    }

    fetch(url, {
      method: 'GET',
      headers: {
        'Accept': 'application/json'
      }
    })
      .then(response => response.json())
      .then(data => {
        this.updateResults(data)
      })
      .catch(error => console.error("Error:", error))
  }

  updateResults(products) {
    if (products.length === 0) {
      this.resultsTarget.innerHTML = "<p>No products found</p>"
    } else {
      this.resultsTarget.innerHTML = products.map(product => {
        return `<div class="product">
                  <h3>${product.name}</h3>
                  <p>${product.description}</p>
                </div>`
      }).join("")
    }
  }
}

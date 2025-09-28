function toggleTodoListItem(event, list, item) {
    const checked = event.target.checked;
    const path = `/todos/${list}/items/${item}/${checked ? 'check' : 'uncheck'}`
    event.preventDefault()
    fetch(path, {method: 'POST', headers: {'Content-Type': 'application/json'}})
        .then(response => {
            if (response.ok)
                return response.json
            else
                throw new Error("Updating item status failed.")
        })
}

function deleteTodoListItem(event, list, item) {
    const path = `/todos/${list}/items/${item}`
    event.preventDefault()
    fetch(path, {method: 'DELETE', headers: {'Content-Type': 'application/json'}})
        .then(response => {
            if (response.ok)
                return response.json
            else
                throw new Error("Deleting item failed.")
        })
        .then(() => location.reload())
}

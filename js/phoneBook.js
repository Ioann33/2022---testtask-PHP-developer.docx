let phoneBookBtn = document.querySelector('.pbook')
content = document.querySelector('.content')
function showUsers(obj){
    content.innerHTML = '<h3 class="text-center" style="color: #bb4f5f">Public PhoneBook</h3>';
    let list = '';
    for (let item of obj) {
        console.log(item)
        list+= `
                            <div style="font-size: 1.6rem">
                                <div style="display: inline-flex; justify-content: space-between; width: 700px; margin-top: 10px">
                                    <div>
                                             ${item.firstname} ${item.lastname} 
                                    </div>
                                    <button type="button" onclick="getUserDetails(${item.id}, 1)" class="btn btn-primary showBtn${item.id}">show details</button>
                                    <button type="button" style="display: none" onclick="getUserDetails(${item.id}, 0)" class="btn btn-primary hideBtn${item.id}">hide details</button>
                                </div>
                                <div class="details${item.id}" style="font-size: 1.2rem; display: flex; justify-content: space-between">
                                    
                                </div>
                            </div>`;
    }
    content.innerHTML += ` <div style="width: 700px; margin: 50px auto 0"><div>${list}</div></div>`;

}
function showUserDetails(item, state){
    let contentClass = ''
    let showBtnClass = ''
    let hideBtnClass = ''
    if (state === 1){
        contentClass = 'details'+item.user[0].id
        showBtnClass = 'showBtn'+item.user[0].id
        hideBtnClass = 'hideBtn'+item.user[0].id
    }else if (state === 0){
        contentClass = 'details'+item
        showBtnClass = 'showBtn'+item
        hideBtnClass = 'hideBtn'+item
    }
    let detailsContent = document.querySelector(`.${contentClass}`)
    let showBtn = document.querySelector(`.${showBtnClass}`)
    let hideBtn = document.querySelector(`.${hideBtnClass}`)
    if (state === 1){
        let phones = ``;
        for (let phone of item.phones) {
            phones+= `<tr><td>${phone.number}</td></tr>`
        }
        let emails = ``;
        for (let email of item.emails) {
            emails+= `<tr><td>${email.email}</td></tr>`
        }
        showBtn.style.display = 'none';
        hideBtn.style.display = 'block';
        detailsContent.innerHTML = `
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Adress</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr><td>${item.user[0].address}</td></tr>
                                            <tr><td>${item.user[0].city}</td></tr>
                                            <tr><td>${item.user[0].country}</td></tr>
                                        </tbody>
                                    </table>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Phones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            ${phones}
                                        </tbody>
                                    </table>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Emails</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            ${emails}
                                        </tbody>
                                    </table>
        `;
    }else if (state === 0){
        showBtn.style.display = 'block';
        hideBtn.style.display = 'none';
        detailsContent.innerText = '';
    }
}
function getUserDetails(id, state) {
    if (state === 1){
        fetch(`/api/showUserDetails/par?id=${id}`)
            .then(res => res.json())
            .then(res => {
                showUserDetails(res, state)
            })
    }else if (state === 0){
        showUserDetails(id, state)
    }
}
phoneBookBtn.onclick = function (e) {
    fetch('/api/getAll')
        .then(res => res.json())
        .then(res => {
            showUsers(res)
        })
    e.preventDefault()
}
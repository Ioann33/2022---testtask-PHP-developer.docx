let mContactBtn = document.querySelector('.mcontact')
let addPhoneBth = ''
let addEmailBth = ''
let saveBtn = ''
content = document.querySelector('.content')
let keys = ''
let lastKey = ''
let countries = ``;
let checked = ``;
let checked2 = ``;
let checked3 = ``;
let phonesStr = ``;
let emailsStr = ``;
let phonesObj = {};
let emailObj = {};
let userObj = {};
let phonesContent = '';
function getMyContact() {
    emailObj = {}
    phonesObj = {}
    fetch(`/api/getMyContact`)
        .then(res => res.json())
        .then(res => {
            for (let item of res.phones) {
                phonesObj[item.id] = {
                    id: item.id,
                    number: item.number,
                    public: item.public,
                    update: 1
                }
            }
            for (let item of res.emails) {
                emailObj[item.id] = {
                    id: item.id,
                    email: item.email,
                    public: item.public,
                    update: 1
                }
            }

            showMyContact(res, phonesObj, emailObj)
        })
}
function updatePhones(id) {
    let selector2 = 'pnum'+id
    let phoneInput = document.querySelector(`.${selector2}`)
    phonesObj[id].number = phoneInput.value
}
function updateEmails(id) {
    let selector6 = 'email'+id
    let emailInput = document.querySelector(`.${selector6}`)
    emailObj[id].email = emailInput.value
}
function updateEmailAccess(id) {
    let selector4 = 'pemailaccess'+id
    let emailCheckBox = document.querySelector(`.${selector4}`)
    if (emailCheckBox.checked){
        emailObj[id].public = 1
    }else{
        emailObj[id].public = 0
    }

}
function updatePhoneAccess(id) {
    let selector3 = 'ppaccess'+id
    let phoneCheckBox = document.querySelector(`.${selector3}`)

    if (phoneCheckBox.checked){
        phonesObj[id].public = 1
    }else{
        phonesObj[id].public = 0
    }

}
function save(){
    let fname = document.querySelector('.uname')
    let usecondname = document.querySelector('.usecondname')
    let address = document.querySelector('.address')
    let city = document.querySelector('.city')
    let country = document.querySelector('.country')
    let publish = document.querySelector('.public')
    let flag = '';
    if (publish.checked){
        flag = 1
    }else{
        flag = 0
    }
    userObj = {
        firstname:fname.value,
        lastname:usecondname.value,
        address:address.value,
        city:city.value,
        country_id:country.value,
        public:flag
    }
    let resObj = {
        user:userObj,
        phones:phonesObj,
        emails:emailObj
    }
    fetch('/api/saveMyContact', {
        method: 'POST',
        body: JSON.stringify(resObj),
        headers: {
            'Content-Type' : 'application/json',
        }
    })
        .then(res => {
            if (res.status === 200){
                getMyContact()
            }
            if (res.status === 400){
                alert(`same problem with request, status: ${res.status}`)
            }
        })



}
function showEmails(emails) {
    let emailsContent = document.querySelector('.emailsContent')
    emailsStr = ``;
    for (let key in emails){
        checked3 = ``;

        if (emails[key].public === 1){
            checked3 = `checked`
        }
        emailsStr+= `
            <tr><td style="display: flex; justify-content: space-between">
             <div style="display: flex">
                 <input type="text" value="${emails[key].email}" onchange="updateEmails(${emails[key].id})" class="email${emails[key].id}" style="margin-right: 5px">
                 <div class="form-check">
                      <input class="form-check-input pemailaccess${emails[key].id}" type="checkbox" onchange="updateEmailAccess(${emails[key].id})" ${checked3}>
                </div>
             </div>
             </td></tr>
        `;

    }

    emailsStr+=`<tr><td>
                    <button type="button" class="btn btn-primary addEmail" style="float: right">Add</button>
                </td></tr>`
    emailsContent.innerHTML = emailsStr

    addEmailBth = document.querySelector('.addEmail')
    if (addEmailBth){
        addEmailBth.onclick = function (e){
            let keysEmail = Object.keys(emailObj)
            let lastKeyEmail =+keysEmail.slice(-1)+1
            emailObj[lastKeyEmail] = {
                id:lastKeyEmail,
                email: '',
                public: 0,
                update: 0
            }
            showEmails(emails)

        }
    }
}
function showPhones(phones) {
    phonesContent = document.querySelector('.phonesContent')
    phonesStr = ``;
    for (let key in phones){
        checked2 = ``;
        if (phones[key].public === 1){
            checked2 = `checked`
        }
        phonesStr+= `
            <tr><td style="display: flex; justify-content: space-between">
             <div style="display: flex">
                 <input type="text" value="${phones[key].number}" onchange="updatePhones(${phones[key].id})" class="pnum${phones[key].id}" style="margin-right: 5px">
                 <div class="form-check">
                      <input class="form-check-input ppaccess${phones[key].id}" type="checkbox" onchange="updatePhoneAccess(${phones[key].id})" ${checked2}>
                </div>
             </div>
             </td></tr>
        `;
    }
    phonesStr+=`<tr><td>
                    <button type="button" class="btn btn-primary addPhone" style="float: right">Add</button>
                 </td></tr>`
    phonesContent.innerHTML = phonesStr
    addPhoneBth = document.querySelector('.addPhone')
    if (addPhoneBth){
        addPhoneBth.onclick = function (e){
            keys = Object.keys(phonesObj)
            lastKey =+keys.slice(-1)+1
            phonesObj[lastKey] = {
                id:lastKey,
                number: '',
                public: 0,
                update: 0
            }
            showPhones(phones)

        }
    }
}
function showMyContact(obj, phonesObj, emailsObj) {
    checked = ``
    if (obj.user[0].public === 1){
        checked = `checked`
    }
    for (let item of obj.countries) {
        if (obj.user[0].country_id === item.id){
            countries+=`<option value="${item.id}" selected>${item.name}</option>`;
        }else{
            countries+=`<option value="${item.id}">${item.name}</option>`;
        }

    }

    content.innerHTML = `<h3 class="text-center" style="color: #bb4f5f">My Contact</h3>`;
    content.innerHTML += `
            <form>
                <div class="form-check form-switch" style="float: right; margin-right: 100px">
                  <input class="form-check-input public" type="checkbox" id="flexSwitchCheckDefault" ${checked}>
                  <label class="form-check-label" for="flexSwitchCheckDefault">Publish my contact</label>
                </div>
                <div style="font-size: 1.2rem; display: flex; justify-content: space-around">
                                     <table>
                                        <thead>
                                            <tr>
                                                <th>Contact</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr><td style="display: flex; justify-content: space-between"><div style="margin-right: 5px">Firstname</div><input type="text" value="${obj.user[0].uname}" class="uname"></td></tr>
                                            <tr><td style="display: flex; justify-content: space-between"><div style="margin-right: 5px">Lastname</div><input type="text" value="${obj.user[0].usecondname}" class="usecondname"></td></tr>
                                            <tr><td style="display: flex; justify-content: space-between"><div style="margin-right: 5px">Address</div><input type="text" value="${obj.user[0].address}" class="address"></td></tr>
                                            <tr><td style="display: flex; justify-content: space-between"><div style="margin-right: 5px">City</div> <input type="text" value="${obj.user[0].city}" class="city"></td></tr>
                                            <tr><td style="display: flex; justify-content: space-between"><div style="margin-right: 5px">Country</div><select class="country">
                                                                    ${countries}
                                                               </select></td></tr>
                                        </tbody>
                                    </table>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Phones</th>
                                            </tr>
                                        </thead>
                                        <tbody class="phonesContent">
                                              
                                        </tbody>
                                    </table>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Emails</th>
                                            </tr>
                                        </thead>
                                        <tbody class="emailsContent">
                                              
                                        </tbody>
                                    </table>           
                </div>
                <input type="submit" class="btn btn-success saveBtn" value="Save" style="float: right; margin-right: 100px; margin-top: 20px; width: 90px">
            </form>
        `;
    showPhones(phonesObj)
    showEmails(emailsObj)
    addEmailBth = document.querySelector('.addEmail')
    saveBtn = document.querySelector('.saveBtn')
    if (saveBtn){
        saveBtn.onclick = function (e){
            save()
            e.preventDefault()
        }
    }
}
if (mContactBtn){
    mContactBtn.onclick = function (e) {
        getMyContact()
        e.preventDefault()
    }
}
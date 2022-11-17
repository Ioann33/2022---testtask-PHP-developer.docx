let logInBtn = document.querySelector('.login')
let content = document.querySelector('.content')
if (logInBtn){
    logInBtn.onclick = function (e) {
        content.innerHTML = `<div class="container-fluid d-flex h-100 justify-content-center align-items-center p-0" style="margin-top: 100px">
    <div class="row bg-white shadow-sm">
        <div class="col border rounded p-4">
            <h3 class="text-center mb-4">LogIn</h3>
            <form style="width: 250px" action="/auth/login" method="post">
                <div class="form-group">
                    <label for="exampleInputUname">Username</label>
                    <input type="text" class="form-control" id="exampleInputUname" aria-describedby="emailHelp" name="uname" required>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password (1234)</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" name="pass" required>
                </div>
                <button type="submit" class="btn btn-primary w-100 mt-2">Войти</button>
            </form>
        </div>
    </div>
</div>`;
        e.preventDefault()
    }
}
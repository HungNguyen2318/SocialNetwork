/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function checkConfirmPassword() {
    //get value of password, confirmPassword
    var password = document.getElementById('password').value;
    var confirmPassword = document.getElementById('confirm_password').value;
    //check lenght of password 
    if (password.length > 0 && confirmPassword.length > 0) {
        //get <label> and <button> element
        var noti_label = document.getElementById('noti_confirm');
        var button_submit = document.getElementById('sign_up');
        //check confirmPassword
        if (password === confirmPassword) {
            //confirmPassword is matched
            button_submit.disabled = false;
            noti_label.style.display = "block";
            noti_label.innerHTML = "Confirm password is match &#9989;";
            noti_label.style.color = '#11F50E';
        } else {
            //confirmPassword is not matched
            button_submit.disabled = true;
            noti_label.style.display = "block";
            noti_label.innerHTML = "Confirm password is not match &#9940;";
            noti_label.style.color = '#FF0000';
        }//end if check match confirmPassword
    }//end if check lenth password and confirmPassword
}









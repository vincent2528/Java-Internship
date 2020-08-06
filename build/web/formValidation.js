function formValidation()
{
var passid = document.registration.passid;
var uname = document.registration.username;
var uemail = document.registration.email;
var ucontact = document.registration.contact;
var confirmpass = document.registration.confirmpass; 
var uform = document.registration;

if(passid_validation(passid,7,12))
{
if(allLetter(uname))
{

if(ValidateEmail(uemail))
{
if(validnumber(ucontact))
{
if(confirmation(passid,confirmpass))
{
if(checkForm(uform))
{
}
}
} 
}
}
}

return false;
}

function passid_validation(passid,mx,my)
{
var passid_len = passid.value.length;
if (passid_len == 0 ||passid_len >= my || passid_len < mx)
{
alert("Password should not be empty / length be between "+mx+" to "+my);
passid.focus();
return false;
}
return true;
}
function allLetter(uname)
{ 
var letters = /^[A-Za-z\s]+$/;
if(uname.value.match(letters))
{
return true;
}
else
{
alert('Username must have alphabet characters only');
uname.focus();
return false;
}
}
function ValidateEmail(uemail)
{
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
if(uemail.value.match(mailformat))
{
return true;
}
else
{
alert("You have entered an invalid email address!");
uemail.focus();
return false;
}
}
function validnumber(contact)
{ 
var letters = /^[A-Za-z]+$/;
if(contact.value.match(letters))
{
return false;
}
else
{
    var contact_len = contact.value.length;
    if (contact_len == 10)
    {
        return true;
    }else{
    alert("Enter valid number");
    contact.focus();
    return false;
    }
}
}
function confirmation(pass,confpass)
{
if(pass.localeCompare(confpass)){
    return true;
}else
{
alert("Password doesnt match!");
confpass.focus();
return false;
}
}

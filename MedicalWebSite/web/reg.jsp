<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>File Upload to Database Demo</title>

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

</head>
<body>

<style>body{
    background: url("photo/background.png");
    background-size: 100% 220%;
}</style>

<p style="text-align: center;"><img width = "450" height = "70" src="photo/siteName.PNG" alt = "wait"></p>

<h2 style="text-align: center;"><span style="color: #00ccff;">РЕГИСТРАЦИЯ</span></h2>

<div style="font-family:Comfortaa;font-size: 120%; margin: 20px 0px 0px 30px"><br/> </div>



<form method="post" action="uploadServlet" enctype="multipart/form-data">

    Имя: <input type="text" name="firstName" id="firstName" required/><br/><br/>

    Фамилия: <input type="text" name="lastName" id="lastName" required/><br/><br/>

    <style>
        .block_for_input {
            width: 200px;
        }
        .block_for_input input {
            width: 100%;
        }
        #block_check {
            height: 5px;
            margin-top: 5px;
            transition: 1s;
        }
    </style>

    Пол:
    <input type="radio" name="sex" id="male" value="male"/>Мужской
    <input type="radio" name="sex" id="female" value="female"/>Женский<br/><br/>

    Логин(почта): <input type="text" name="email" id="email" required/><br/>

    <div class="block_for_input">
    Пароль: <input type="password" id="pass" name="pass" required/>

        <div id="block_check" name="block_check"></div>
        <div id="err"></div>
    </div>

    Повторите пароль: <input type = "password" id="confirm_pass" name="confirm_pass" required></br></br>
    Номер телефона: <input type = "text" id="phone" name="phone" required></br></br>

    <script>
        var s_letters = "qwertyuiopasdfghjklzxcvbnm"; // Буквы в нижнем регистре
        var b_letters = "QWERTYUIOPLKJHGFDSAZXCVBNM"; // Буквы в верхнем регистре
        var digits = "0123456789"; // Цифры
        var specials = "!@#$%^&*()_-+=\|/.,:;[]{}"; // Спецсимволы
        var input_test = document.getElementById('pass');//получаем поле
        var block_check = document.getElementById('block_check');//получаем блок с индикатором
        input_test.addEventListener('keyup', function(evt){
            var input_test_val = input_test.value;//получаем значение из поля
            var is_s = false; // Есть ли в пароле буквы в нижнем регистре
            var is_b = false; // Есть ли в пароле буквы в верхнем регистре
            var is_d = false; // Есть ли в пароле цифры
            var is_sp = false; // Есть ли в пароле спецсимволы
            for (var i = 0; i < input_test_val.length; i++) {
                /* Проверяем каждый символ пароля на принадлежность к тому или иному типу */
                if (!is_s && s_letters.indexOf(input_test_val[i]) != -1) {
                    is_s = true;
                }
                else if (!is_b && b_letters.indexOf(input_test_val[i]) != -1) {
                    is_b = true;
                }
                else if (!is_d && digits.indexOf(input_test_val[i]) != -1) {
                    is_d = true;
                }
                else if (!is_sp && specials.indexOf(input_test_val[i]) != -1) {
                    is_sp = true;
                }
            }
            var rating = 0;
            if (is_s) rating++; // Если в пароле есть символы в нижнем регистре, то увеличиваем рейтинг сложности
            if (is_b) rating++; // Если в пароле есть символы в верхнем регистре, то увеличиваем рейтинг сложности
            if (is_d) rating++; // Если в пароле есть цифры, то увеличиваем рейтинг сложности
            if (is_sp) rating++; // Если в пароле есть спецсимволы, то увеличиваем рейтинг сложности
            /* Далее идёт анализ длины пароля и полученного рейтинга, и на основании этого готовится текстовое описание сложности пароля */
            if (input_test_val.length < 6 && rating < 3) {
                block_check.style.width = "10%";
                block_check.style.backgroundColor = '#e7140d';
            }
            else if (input_test_val.length < 6 && rating >= 3) {
                block_check.style.width = "50%";
                block_check.style.backgroundColor = '#ffdb00';
            }
            else if (input_test_val.length >= 8 && rating < 3) {
                block_check.style.width = "50%";
                block_check.style.backgroundColor = '#ffdb00';
            }
            else if (input_test_val.length >= 8 && rating >= 3) {
                block_check.style.width = "100%";
                block_check.style.backgroundColor = '#61ac27';
            }
            else if (input_test_val.length >= 6 && rating == 1) {
                block_check.style.width = "10%";
                block_check.style.backgroundColor = '#e7140d';
            }
            else if (input_test_val.length >= 6 && rating > 1 && rating < 4) {
                block_check.style.width = "50%";
                block_check.style.backgroundColor = '#ffdb00';
            }
            else if (input_test_val.length >= 6 && rating == 4) {
                block_check.style.width = "100%";
                block_check.style.backgroundColor = '#61ac27';
            }
        });

    </script>

    <script>
        function passcorr() {
            var pass = document.getElementById("input_test").value;
            var button = document.getElementById("submit");
            var p = /^[a-zA-Z0-9]+$/;
            if (p.test(pass))
            {
                err = ""; // ничего не пишем так как вывести нужно только одно Успешно
                // button.disabled = false;
            } else {
                // button.disabled = true;
                err = "<p color=\'red\'> Введены недопустимые символы! Разрешены только латинские буквы и цифры!</p>";
                document.getElementById("err").innerHTML=err;
                exit; // прерываем так как есть ошибка
            }
            if (pass.length>=6&&pass.length<=20){
                // button.disabled = false;
                err = "<p color=\'green\'>Успешно!</p>";
            } else {
                // button.disabled = true;
                err = "<p color=\'red\'>Пароль неверной длины. Пароль должен быть не менее 6 и не более 20 символов!</p>";
                document.getElementById("err").innerHTML=err;
                exit;
            }
            document.getElementById("err").innerHTML=err;
        }
    </script>

    <script>

        $(document).on("click", "#b", function() {

            $.ajax({
                type: "post",
                url: "uploadServlet",
                data: {"email":document.getElementById('email').value,
                    "firstName":document.getElementById('firstName').value,
                    "lastName":document.getElementById('lastName').value,
                    "pass":document.getElementById('pass').value,
                    "confirm_pass":document.getElementById('confirm_pass').value,
                    "phone":document.getElementById('phone').value
                },
                success: function(data) {
                    if(data === 'ok') {
                        document.location.href="/profile";
                    }
                    else {
                        document.getElementById('correct_email').style.color = 'red';
                        $("#correct_email").text(data);
                    }
                }
            });
            return false;
        });

    </script>

    <div id="correct_email"></div>

    <div class="formname">

        <input id="checkbox" type="checkbox" name="checkbox" onchange="document.getElementById('b').disabled = !this.checked;" />

        <label for="checkbox">Настоящим подтверждаю, что я согласен на обработку персональных данных</label><br/>

        <button disabled="disabled" id="b">Зарегестрироваться</button>
    </div>

</form>

</body>
</html>

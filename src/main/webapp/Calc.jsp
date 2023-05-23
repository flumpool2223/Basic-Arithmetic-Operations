<!DOCTYPE html>
<html>
<head>
    <title>四則演算</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#calculateBtn').click(function() {
                // クリアボタンがクリックされたときの処理
                $('#clearBtn').click(function() {
                    // 入力欄と結果欄をクリア
                    $('#operand1').val('');
                    $('#operand2').val('');
                    $('#result').val('');

                    // 演算子選択を初期状態に戻す
                    $('#operator').val('+');
                });

                // 計算ボタンがクリックされたときの処理
                var operand1 = $('#operand1').val();
                var operator = $('#operator').val();
                var operand2 = $('#operand2').val();

                //非同期通信で画面遷移せずに結果を表示
                $.ajax({
                    type: 'POST',
                    url: 'CalcServlet',
                    data: {
                        operand1: operand1,
                        operator: operator,
                        operand2: operand2
                    },
                    success: function(result) {
                        $('#result').val(result);
                    }
                });
            });
        });
    </script>
</head>
<body>
    <h1>四則演算</h1>
    <label for="operand1"></label>
    <input type="number" id="operand1" name="operand1" min="0" max="999" required>
    
    <label for="operator"></label>
    <select id="operator" name="operator">
        <option value="+">+</option>
        <option value="-">-</option>
        <option value="*">×</option>
        <option value="/">÷</option>
    </select>
    
    <label for="operand2"></label>
    <input type="number" id="operand2" name="operand2" min="0" max="999" required>
    
    =
    
    <label for="result"></label>
    <input type="text" id="result" name="result" readonly><br><br>
    
    <input type="button" id="clearBtn" value="クリア">
    <input type="button" id="calculateBtn" value="計算">

</body>
</html>

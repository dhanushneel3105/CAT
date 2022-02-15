/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function isNumberKey(evt)
{
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if ((charCode > 31 && charCode!=46 && (charCode < 48 || charCode > 57)))
    {
        alert("only number allowed");
        return false;
    }
    else
    {
        return true;
    }
}
function checkNumber(evt)
{
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (charCode < 48 || charCode > 57)
    {
        alert("only number allowed");
        return false;
    }
    else
    {
        return true;
    }
}
function checkNumberPoint(evt)
{
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (charCode!=46 && (charCode < 48 || charCode > 57))
    {
        alert("only number allowed");
        return false;
    }
    else
    {
        return true;
    }
}
 function textLimit(field, maxlen) 
 {
    if (field.value.length > maxlen + 1)
    alert('your input has been truncated! Only '+maxlen+' characters allowed');
    if (field.value.length > maxlen)
    field.value = field.value.substring(0, maxlen);
}
function isValidEmailAddress(emailAddress)
{
        var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
        return pattern.test(emailAddress);
}

function addRowProfCert(rowId,tab_id)
{
    var rowCount = $('#'+tab_id+' tr').length;
    rowCount=rowCount-1;
    if(rowCount<=60)
    {
        var TR = document.getElementById(rowId);
        var new_TR = TR.parentNode.appendChild(TR.cloneNode(true));
        var cells = new_TR.cells;
        //alert(" -- "+cells.innerHTML);
        var l = cells.length;
        rowCount++;
        var hidden = cells[0].firstChild;
        hidden.value = rowCount;
        hidden.nextSibling.innerHTML = rowCount;
        for(var i=1;i<l;i++)
        {
            cells[i].firstChild.value = '';
            cells[i].childNodes[0].id = cells[i].childNodes[0].name + rowCount ;
        }
    }
}

function addRowQual(rowId,tab_id)
{
    $(".date").datepicker("destroy");
    var rowCount = $('#'+tab_id+' tr').length;
    rowCount=rowCount-1;
    if(rowCount<=60)
    {
        var TR = document.getElementById(rowId);
        var new_TR = TR.parentNode.appendChild(TR.cloneNode(true));
        var cells = new_TR.cells;
        //alert(" -- "+cells.innerHTML);
        var l = cells.length;
        rowCount++;
        var hidden = cells[0].firstChild;
        hidden.value = rowCount;
        hidden.nextSibling.innerHTML = rowCount;
        for(var i=1;i<l;i++)
        {
            cells[i].firstChild.value = '';
            cells[i].childNodes[0].id = cells[i].childNodes[0].name + rowCount ;
        }
    }
    $(".date").id = 'datepicker' + rowId;
    $('.date').each(function(i) {
        this.id = 'datepicker' + i;
        $(this).datepicker({ dateFormat: 'dd-mm-yy', changeMonth: true, changeYear: true });
    });
}

function removeRow(tab_id)
{
    var rowCount = $('#'+tab_id+' tr').length;
    rowCount=rowCount-1;
    if(rowCount>=2)
    {
        var tab = document.getElementById(tab_id);
        var rows = tab.rows;
        var last_row = rows[rows.length-1];
        last_row.parentNode.removeChild(last_row);                                            
        rowCount--;
    }
}
function deleteFile(rollno, file_for)
{
    if(confirm("Are you sure?"))
    {
        $('#mode').val('deleteFile');
        $('#file_for').val(file_for);
        window.location.href="TPFileDeleteServlet?mode=deleteFile&file_for="+file_for;
    }
}

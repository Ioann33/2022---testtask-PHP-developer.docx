<form method="post" action="<?=Route::url('note', 'update')?>">
    <label>Note:
        <input type="text" value="<?=$oldText?>" name="note">
    </label>
        <input type="hidden" value="<?=$index?>" name="index">
    <input type="submit" value="save">
</form>

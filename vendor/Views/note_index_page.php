<div>
    <a href="<?= Route::url('note', 'create')?>">new note</a>
    <table>
        <thead>
            <tr>
                <th>id</th>
                <th>note</th>
                <th>action</th>
            </tr>
        </thead>
        <tbody>
            <?php if (!empty($notes)):?>
                <?php foreach ($notes as $note):?>
                    <tr>
                        <td><?= $note['id']?></td>
                        <td><?= $note['text']?></td>
                        <td>
                            <div class="button">
                                <form method="post" action="<?=Route::url('note', 'edit')?>">
                                    <input type="hidden" value="<?= $note['id']?>" name="index">
                                    <input type="submit" value="update">
                                </form>
                                <form method="post" action="<?=Route::url('note', 'delete')?>">
                                    <input type="hidden" value="<?= $note['id']?>" name="index">
                                    <input type="submit" value="delete">
                                </form>
                            </div>
                        </td>
                    </tr>
                <?php endforeach;?>
            <?php endif;?>
        </tbody>
    </table>
</div>

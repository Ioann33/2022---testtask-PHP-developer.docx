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
                        <td></td>
                    </tr>
                <?php endforeach;?>
            <?php endif;?>
        </tbody>
    </table>
</div>

<?php
// localhost = Hostname Server
// root = username server
// '' = pasword Server
// skema_rr = Nama dari database
$koneksi = mysqli_connect('localhost', 'root', '', 'skema_rr');

if ($koneksi) {
    echo 'Koneksi berhasil';
} else {
    echo 'Koneksi gagal';
}

$query = "SELECT idPengajar, Nama, Alamat, Jenis_kelamin, Email, No_hp FROM pengajar";
$nilai = $koneksi->query($query);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tampilkan data</title>
</head>

<body>

    <table border="1" cellpadding="10" cellspacing="0" style="margin: 20px;">
        <tr>
            <th>Nama</th>
            <th>Alamat</th>
            <th>Jenis_kelamin</th>
            <th>Email</th>
            <th>No_hp</th>
            <th>Edit</th>
        </tr>
        <?php foreach ($nilai as $data) : ?>
            <tr>
                <td> <?php echo $data['Nama'] ?> </td>
                <td> <?php echo $data['Alamat'] ?> </td>
                <td> <?php echo $data['Jenis_kelamin'] ?> </td>
                <td> <?php echo $data['Email'] ?> </td>
                <td> <?php echo $data['No_hp'] ?> </td>
                <td>
                    <form action="index.php" method="Get">
                        <a href="index.php?pengajar_id=<?php echo $data['idPengajar'] ?>">Edit</a>
                        <a href="index.php?Hapus_pengajar=<?php echo $data['idPengajar'] ?>">Hapus</a>
                    </form>
                </td>
            </tr>
        <?php endforeach ?>
    </table>
    <section id="Form Create">
        <h1>/====== Tambah data =====/</h1>
        <form action="index.php" method="post">
            <input type="hidden" name="idPengajar">
            <input type="text" placeholder="Masukan Nama" name="Nama">
            <input type="text" placeholder="Masukan Alamat" name="Alamat">
            <input type="text" placeholder="Jenis_kelamin" name="Jk">
            <input type="text" placeholder="No Email" name="Email">
            <input type="text" placeholder="No hp" name="No_Hp">
            <button type="submit">Kirim</button>
        </form>
    </section>


    <?php
    // ========= Fungsi Hapus ======== //
    function hapus_pengajar($id)
    {
        global $koneksi;
        mysqli_query($koneksi, "DELETE FROM pengajar WHERE idPengajar = '$id'");
    }

    if (isset($_GET['Hapus_pengajar'])) {
        hapus_pengajar($_GET['Hapus_pengajar']);
    }
    // ========= Fungsi Hapus ======== //

    // ========= Fungsi Create ======== //
    function create_data($Nama, $Alamat, $JK, $Email, $No_hp)
    {
        global $koneksi;
        $koneksi->query("INSERT INTO pengajar (Nama, Alamat, Jenis_kelamin, Email, No_hp) VALUES ('$Nama','$Alamat','$JK','$Email','$No_hp')");
    }

    if (
        isset($_POST['Nama']) &&
        isset($_POST['Alamat']) &&
        isset($_POST['Jk']) &&
        isset($_POST['Email']) &&
        isset($_POST['No_Hp'])
    ) {
        $Nama = $_POST['Nama'];
        $Alamat = $_POST['Alamat'];
        $JK = $_POST['Jk'];
        $Email = $_POST['Email'];
        $No_hp = $_POST['No_Hp'];

        create_data($Nama, $Alamat, $JK, $Email, $No_hp);
    }
    // ========= Fungsi Create ======== //


    // ========= Fungsi Edit ======== //

    function edit($id)
    {
        global $koneksi;
        $query = mysqli_query($koneksi, "Select * from pengajar where idPengajar = '$id'");
        return mysqli_fetch_assoc($query);
    }

    if (isset($_GET['pengajar_id'])) {
        $data = edit($_GET['pengajar_id']);
        $id = $data['idPengajar'];
        $Nama = $data['Nama'];
        $Alamat = $data['Alamat'];
        $Jk = $data['Jenis_kelamin'];
        $Email = $data['Email'];
        $No_hp = $data['No_hp'];
    }

    // ========= Fungsi Edit ======== //


    // ========= Fungsi Update ======== //
    function update($id, $Nama, $Alamat, $JK, $Email, $No_hp)
    {
        global $koneksi;
        mysqli_query($koneksi, "UPDATE pengajar SET 
        Nama='$Nama',
        Alamat='$Alamat',
        Jenis_kelamin='$JK',
        Email='$Email',
        No_hp='$No_hp' WHERE idPengajar = '$id'");
    }

    if (
        isset($_POST['idPengajar']) &&
        isset($_POST['Nama']) &&
        isset($_POST['Alamat']) &&
        isset($_POST['Jk']) &&
        isset($_POST['Email']) &&
        isset($_POST['No_hp'])
    ) {
        $id = isset($_POST['idPengajar']) ? $_POST['idPengajar'] : '';
        $Nama = isset($_POST['Nama']) ? $_POST['Nama'] : '';
        $Alamat = isset($_POST['Alamat']) ? $_POST['Alamat'] : '';
        $JK = isset($_POST['Jk']) ? $_POST['Jk'] : '';
        $Email = isset($_POST['Email']) ? $_POST['Email'] : '';
        $No_hp = isset($_POST['No_hp']) ? $_POST['No_hp'] : '';

        update($id, $Nama, $Alamat, $JK, $Email, $No_hp);
    }
    // ========= Fungsi Update ======== //


    ?>


    <section id="Form Update">
        <h1>/====== Update data =====/</h1>
        <form action="index.php" method="post">
            <input type="hidden" name="idPengajar" value="<?php echo isset($id) ? $id : ''; ?>">
            <input type="text" placeholder="Masukan Nama" name="Nama" value="<?php echo isset($Nama) ? $Nama : ''; ?>">
            <input type="text" placeholder="Masukan Alamat" name="Alamat" value="<?php echo isset($Alamat) ? $Alamat : ''; ?>">
            <input type="text" placeholder="Jenis_kelamin" name="Jk" value="<?php echo isset($Jk) ? $Jk : ''; ?>">
            <input type="text" placeholder="Email" name="Email" value="<?php echo isset($Email) ? $Email : ''; ?>">
            <input type="text" placeholder="No hp" name="No_hp" value="<?php echo isset($No_hp) ? $No_hp : ''; ?>">
            <button type="submit">Update</button>
        </form>
    </section>
    <?php


    ?>
</body>

</html>
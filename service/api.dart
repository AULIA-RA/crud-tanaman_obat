// class Api {
//     static const _host = 'http://192.168.67.209:8000/tanaman_obat';
//     static const register = '$_host/insertDataUser.php';
//     static const getDataUser = '$_host/getDataUser.php';
//     static const updateDataUser = '$_host/updateData.php';
//     static const deleteDataUser = '$_host/delData.php';

//     // Endpoints untuk tanaman (Plants)
//     static const getPlants = '$_host/getplants.php';
//     static const insertPlant = '$_host/insertplants.php';
//     static const updatePlant = '$_host/updateplants.php';
//     static const deletePlant = '$_host/delplants.php';

//     static const scanPlant = '$_host/scan.php';
//     static const login = '$_host/login.php';
//     static const Register = '$_host/register.php';
     

// }
class Api {
    static const _host = 'http://127.0.0.1/tanaman_obat'; // Ganti dengan IP lokal komputer Anda
    static const getPlants = '$_host/getplants.php';
    static const insertPlant = '$_host/insertplants.php';
    static const updatePlant = '$_host/updateplants.php';
    static const deletePlant = '$_host/delplants.php';
}

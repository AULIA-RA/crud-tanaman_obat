<?php

$hostname='localhost';
$username='root';
$pass='';
$dbname='tanaman_obat';
$port= '3306';

//koneksi ke database
$conn=mysqli_connect($hostname,$username,$pass,$dbname,$port);
//apakah berhasil
if(!$conn){
    print_r(json_encode("gagal"));

}else {
    print_r(json_encode("berhasil"));
}
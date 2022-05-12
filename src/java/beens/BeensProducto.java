/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beens;

import java.io.InputStream;

/**
 *
 * @author varga
 */
public class BeensProducto {

    int id_producto, cantidad, estado, id_categoria, id_registro;
    private String nombres, descrip;
    private InputStream img;
    float costo;

    public int getId_registro() {
        return id_registro;
    }

    public void setId_registro(int id_registro) {
        this.id_registro = id_registro;
    }

    public float getCosto() {
        return costo;
    }

    public void setCosto(float costo) {
        this.costo = costo;
    }

    public BeensProducto() {
    }

    public BeensProducto(int id_producto, float costo, int cantidad, int estado, int id_categoria, int id_registro, String nombres, String descrip, InputStream img) {
        this.id_producto = id_producto;
        this.costo = costo;
        this.cantidad = cantidad;
        this.id_registro = id_registro;
        this.estado = estado;
        this.id_categoria = id_categoria;
        this.nombres = nombres;
        this.descrip = descrip;
        this.img = img;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_prducto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getDescrip() {
        return descrip;
    }

    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }

    public InputStream getImg() {
        return img;
    }

    public void setImg(InputStream img) {
        this.img = img;
    }
}

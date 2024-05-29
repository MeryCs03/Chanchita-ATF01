package pe.edu.utp.ATF01.model.response;

import pe.edu.utp.ATF01.model.Deposito;

import java.util.List;

public record BuscarDepositos(String nombre_chanchita, List<Deposito> depositos) {
   
}

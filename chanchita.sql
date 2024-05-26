-- Volcando estructura para tabla chanchita.Chanchita
CREATE TABLE IF NOT EXISTS `Chanchita` (
  `Nombre` varchar(255) NOT NULL,
  `NumeroCuenta` bigint(20) NOT NULL,
  PRIMARY KEY (`NumeroCuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando estructura para tabla chanchita.Deposito
CREATE TABLE IF NOT EXISTS `Deposito` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroCuenta` bigint(20) NOT NULL,
  `FechaHora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `NombrePersona` varchar(255) DEFAULT NULL,
  `Monto` decimal(10,2) DEFAULT NULL,
  `Detalle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NumeroCuenta` (`NumeroCuenta`),
  CONSTRAINT `Deposito_ibfk_1` FOREIGN KEY (`NumeroCuenta`) REFERENCES `Chanchita` (`NumeroCuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=LATIN1_SWEDISH_CI;

CREATE TABLE IF NOT EXISTS `usuario` (
  `login` VARCHAR(20) NOT NULL,
  `fullname` VARCHAR(150) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `password` CHAR(32) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELIMITER //
CREATE PROCEDURE `BuscarChanchitaPorNombre`(
    IN pNombre VARCHAR(255)
)
BEGIN
    SELECT * FROM Chanchita WHERE Nombre = pNombre;
END//
DELIMITER ;

-- Volcando estructura para procedimiento chanchita.RegistrarChanchita
DELIMITER //
CREATE PROCEDURE `RegistrarChanchita`(
    IN p_NombreChanchita VARCHAR(255),
    IN p_NumeroCuenta BIGINT
)
BEGIN
    -- Inserta una nueva fila en la tabla Chanchita
    INSERT INTO Chanchita (Nombre, NumeroCuenta)
    VALUES (p_NombreChanchita, p_NumeroCuenta);
END//
DELIMITER ;

-- Volcando estructura para procedimiento chanchita.RegistrarDeposito
DELIMITER //
CREATE PROCEDURE `RegistrarDeposito`(
    IN pNumeroCuenta BIGINT,
    IN pFechaHora TIMESTAMP,
    IN pNombrePersona VARCHAR(255),
    IN pMonto DECIMAL(10,2),
    IN pDetalle VARCHAR(255)
)
BEGIN
    -- Inserta un nuevo depósito en la tabla Deposito
    INSERT INTO Deposito (NumeroCuenta, FechaHora, NombrePersona, Monto, Detalle)
    VALUES (pNumeroCuenta, pFechaHora, pNombrePersona, pMonto, pDetalle);
END//
DELIMITER ;

DELIMITER //

CREATE PROCEDURE `pr_checkUser`(
	IN `pEmail` VARCHAR(150),
	IN `pClave` VARCHAR(32)
)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT 'Obtiene el usuario que cumple el criterio de tener el email y la clave suministrada'

	SELECT login, email, fullname 
	FROM usuario 
	WHERE email = pEmail AND pwd = pClave 
	LIMIT 1;
END //

DELIMITER ;



CREATE DATABASE IF NOT EXISTS chanchita;
USE chanchita;

CREATE TABLE IF NOT EXISTS `Chanchita` (
  `Nombre` VARCHAR(255) NOT NULL,
  `NumeroCuenta` BIGINT(20) NOT NULL,
  PRIMARY KEY (`NumeroCuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `usuario` (
  `login` VARCHAR(20) NOT NULL COLLATE 'latin1_swedish_ci',
  `fullname` VARCHAR(150) NOT NULL COLLATE 'latin1_swedish_ci',
  `email` VARCHAR(150) NOT NULL COLLATE 'latin1_swedish_ci',
  `pwd` CHAR(32) NOT NULL COLLATE 'latin1_swedish_ci',
  UNIQUE (`email`),
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `Deposito` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `NumeroCuenta` BIGINT(20) NOT NULL,
  `FechaHora` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `NombrePersona` VARCHAR(20) COLLATE 'latin1_swedish_ci' DEFAULT NULL,
  `Monto` DECIMAL(10,2) DEFAULT NULL,
  `Detalle` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NumeroCuenta` (`NumeroCuenta`),
  KEY `NombrePersona` (`NombrePersona`),
  CONSTRAINT `Deposito_ibfk_1` FOREIGN KEY (`NumeroCuenta`) REFERENCES `Chanchita` (`NumeroCuenta`),
  CONSTRAINT `Deposito_ibfk_2` FOREIGN KEY (`NombrePersona`) REFERENCES `usuario` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--datosChanchita
INSERT INTO Chanchita (Nombre, NumeroCuenta) VALUES 
('Pijamada', 1234567890183456), 
('Pollada', 9176543210987654), 
('Prueba', 1357924680246801),
('Cevichada', 2468013579246801), 
('Sabado de playita', 3692581478523690), 
('Noche de cine', 8024671357924680);


--datosDepositos
INSERT INTO Deposito (NumeroCuenta, FechaHora, NombrePersona, Monto, Detalle) VALUES 
(1234567890183456, '2024-05-30 17:55:38', 'Pijamada', 100.00, 'Depósito de pijamada'),
 (9176543210987654, '2024-05-30 17:55:38', 'Pollada', 200.00, 'Depósito de pollada'), 
 (1357924680246801, '2024-05-30 17:55:38', 'Prueba', 150.50, 'Depósito de prueba'), 
 (2468013579246801, '2024-05-30 17:55:38', 'Cevichada', 300.75, 'Depósito de cevichada'), 
 (3692581478523690, '2024-05-30 17:55:38', 'Sabado de playita', 180.25, 'Depósito de sábado de playita'), 
 (8024671357924680, '2024-05-30 17:55:38', 'Noche de cine', 250.30, 'Depósito de noche de cine');


DELIMITER //
CREATE PROCEDURE `BuscarDepositosPorNumeroCuenta`(
    IN pNumeroCuenta BIGINT
)
BEGIN
    SELECT Nombre
    FROM Chanchita c
    WHERE c.NumeroCuenta = pNumeroCuenta;

    SELECT d.NombrePersona as 'Nombre', d.FechaHora as 'Fecha', d.Detalle, d.Monto
    FROM Deposito d
    WHERE d.NumeroCuenta = pNumeroCuenta;
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
BEGIN
	SELECT login, email, fullname 
	FROM usuario 
	WHERE email = pEmail AND password = pClave 
	LIMIT 1;
END //

DELIMITER ;


CREATE DEFINER=`chanchita`@`%` PROCEDURE `pr_checkUserByEmail`(
	IN `userEmail` VARCHAR(150)
)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN
    SELECT `login`
    FROM `usuario`
    WHERE `email` = userEmail
    LIMIT 1;
END
DELIMITER ;

CREATE DEFINER=`chanchita`@`%` PROCEDURE `pr_registerUser`(
	IN `userLogin` VARCHAR(20),
	IN `userFullname` VARCHAR(150),
	IN `userEmail` VARCHAR(150),
	IN `userPwd` VARCHAR(60)
)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN
    INSERT INTO `usuario` (`login`, `fullname`, `email`, `pwd`)
    VALUES (userLogin, userFullname, userEmail, userPwd);
END



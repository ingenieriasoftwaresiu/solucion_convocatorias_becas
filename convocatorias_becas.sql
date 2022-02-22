/*
 Navicat MySQL Data Transfer

 Source Server         : MySQL_Desarrollo
 Source Server Type    : MySQL
 Source Server Version : 100130
 Source Host           : localhost:3306
 Source Schema         : convocatorias_becas

 Target Server Type    : MySQL
 Target Server Version : 100130
 File Encoding         : 65001

 Date: 18/02/2022 15:28:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ciudades
-- ----------------------------
DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE `ciudades`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_departamento` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_departamento`(`id_departamento`) USING BTREE,
  CONSTRAINT `ciudades_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for convocatorias
-- ----------------------------
DROP TABLE IF EXISTS `convocatorias`;
CREATE TABLE `convocatorias`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for criterios_evaluacion
-- ----------------------------
DROP TABLE IF EXISTS `criterios_evaluacion`;
CREATE TABLE `criterios_evaluacion`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for criteriosxconvocatoria
-- ----------------------------
DROP TABLE IF EXISTS `criteriosxconvocatoria`;
CREATE TABLE `criteriosxconvocatoria`  (
  `id_criterio` int NOT NULL,
  `id_convocatoria` int NOT NULL,
  `id_subcriterio` int NOT NULL,
  `peso` int NOT NULL,
  PRIMARY KEY (`id_criterio`, `id_convocatoria`, `id_subcriterio`) USING BTREE,
  INDEX `id_convocatoria`(`id_convocatoria`) USING BTREE,
  INDEX `id_subcriterio`(`id_subcriterio`) USING BTREE,
  CONSTRAINT `criteriosxconvocatoria_ibfk_1` FOREIGN KEY (`id_criterio`) REFERENCES `criterios_evaluacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `criteriosxconvocatoria_ibfk_2` FOREIGN KEY (`id_convocatoria`) REFERENCES `convocatorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `criteriosxconvocatoria_ibfk_3` FOREIGN KEY (`id_subcriterio`) REFERENCES `subcriterios_evaluacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for departamentos
-- ----------------------------
DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for departamentosxconvocatoria
-- ----------------------------
DROP TABLE IF EXISTS `departamentosxconvocatoria`;
CREATE TABLE `departamentosxconvocatoria`  (
  `id_departamento` int NOT NULL,
  `id_convocatoria` int NOT NULL,
  PRIMARY KEY (`id_departamento`, `id_convocatoria`) USING BTREE,
  INDEX `id_convocatoria`(`id_convocatoria`) USING BTREE,
  CONSTRAINT `departamentosxconvocatoria_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `departamentosxconvocatoria_ibfk_2` FOREIGN KEY (`id_convocatoria`) REFERENCES `convocatorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for documentos_soporte
-- ----------------------------
DROP TABLE IF EXISTS `documentos_soporte`;
CREATE TABLE `documentos_soporte`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for documentosxconvocatoria
-- ----------------------------
DROP TABLE IF EXISTS `documentosxconvocatoria`;
CREATE TABLE `documentosxconvocatoria`  (
  `id_documento` int NOT NULL,
  `id_convocatoria` int NOT NULL,
  PRIMARY KEY (`id_documento`, `id_convocatoria`) USING BTREE,
  INDEX `id_convocatoria`(`id_convocatoria`) USING BTREE,
  CONSTRAINT `documentosxconvocatoria_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos_soporte` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `documentosxconvocatoria_ibfk_2` FOREIGN KEY (`id_convocatoria`) REFERENCES `convocatorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for documentosxpostulacion
-- ----------------------------
DROP TABLE IF EXISTS `documentosxpostulacion`;
CREATE TABLE `documentosxpostulacion`  (
  `id_postulacion` int NOT NULL,
  `id_documento` int NOT NULL,
  `ruta_documento` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cumple` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `observaciones` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_postulacion`, `id_documento`) USING BTREE,
  INDEX `id_documento`(`id_documento`) USING BTREE,
  CONSTRAINT `documentosxpostulacion_ibfk_1` FOREIGN KEY (`id_postulacion`) REFERENCES `postulaciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `documentosxpostulacion_ibfk_2` FOREIGN KEY (`id_documento`) REFERENCES `documentos_soporte` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for estados_postulacion
-- ----------------------------
DROP TABLE IF EXISTS `estados_postulacion`;
CREATE TABLE `estados_postulacion`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for evaluacionesxpostulacion
-- ----------------------------
DROP TABLE IF EXISTS `evaluacionesxpostulacion`;
CREATE TABLE `evaluacionesxpostulacion`  (
  `id_postulacion` int NOT NULL,
  `id_criterio` int NOT NULL,
  `id_subcriterio` int NOT NULL,
  `calificacion` int NOT NULL,
  `calificacion_ponderada` int NOT NULL,
  `observacion` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_postulacion`, `id_criterio`, `id_subcriterio`) USING BTREE,
  INDEX `id_criterio`(`id_criterio`) USING BTREE,
  INDEX `id_subcriterio`(`id_subcriterio`) USING BTREE,
  CONSTRAINT `evaluacionesxpostulacion_ibfk_1` FOREIGN KEY (`id_postulacion`) REFERENCES `postulaciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `evaluacionesxpostulacion_ibfk_2` FOREIGN KEY (`id_criterio`) REFERENCES `criterios_evaluacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `evaluacionesxpostulacion_ibfk_3` FOREIGN KEY (`id_subcriterio`) REFERENCES `subcriterios_evaluacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for focos_departamento
-- ----------------------------
DROP TABLE IF EXISTS `focos_departamento`;
CREATE TABLE `focos_departamento`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for focosxconvocatoria
-- ----------------------------
DROP TABLE IF EXISTS `focosxconvocatoria`;
CREATE TABLE `focosxconvocatoria`  (
  `id_foco` int NOT NULL,
  `id_convocatoria` int NOT NULL,
  PRIMARY KEY (`id_foco`, `id_convocatoria`) USING BTREE,
  INDEX `id_convocatoria`(`id_convocatoria`) USING BTREE,
  CONSTRAINT `focosxconvocatoria_ibfk_1` FOREIGN KEY (`id_foco`) REFERENCES `focos_departamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `focosxconvocatoria_ibfk_2` FOREIGN KEY (`id_convocatoria`) REFERENCES `convocatorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for postulaciones
-- ----------------------------
DROP TABLE IF EXISTS `postulaciones`;
CREATE TABLE `postulaciones`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int NOT NULL,
  `id_convocatoria` int NOT NULL,
  `id_departamento` int NOT NULL,
  `id_foco` int NOT NULL,
  `id_programa` int NOT NULL,
  `nombre_tesis` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `palabras_claves` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ruta_tesis` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_estado` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_estudiante`(`id_estudiante`) USING BTREE,
  INDEX `id_convocatoria`(`id_convocatoria`) USING BTREE,
  INDEX `id_departamento`(`id_departamento`) USING BTREE,
  INDEX `id_foco`(`id_foco`) USING BTREE,
  INDEX `id_programa`(`id_programa`) USING BTREE,
  INDEX `id_estado`(`id_estado`) USING BTREE,
  CONSTRAINT `postulaciones_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `postulaciones_ibfk_2` FOREIGN KEY (`id_convocatoria`) REFERENCES `convocatorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `postulaciones_ibfk_3` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `postulaciones_ibfk_4` FOREIGN KEY (`id_foco`) REFERENCES `focos_departamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `postulaciones_ibfk_5` FOREIGN KEY (`id_programa`) REFERENCES `programas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `postulaciones_ibfk_6` FOREIGN KEY (`id_estado`) REFERENCES `estados_postulacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for preguntas_postulacion
-- ----------------------------
DROP TABLE IF EXISTS `preguntas_postulacion`;
CREATE TABLE `preguntas_postulacion`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for preguntasxpostulacion
-- ----------------------------
DROP TABLE IF EXISTS `preguntasxpostulacion`;
CREATE TABLE `preguntasxpostulacion`  (
  `id_pregunta` int NOT NULL,
  `id_postulacion` int NOT NULL,
  PRIMARY KEY (`id_pregunta`, `id_postulacion`) USING BTREE,
  INDEX `id_postulacion`(`id_postulacion`) USING BTREE,
  CONSTRAINT `preguntasxpostulacion_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas_postulacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `preguntasxpostulacion_ibfk_2` FOREIGN KEY (`id_postulacion`) REFERENCES `postulaciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for programas
-- ----------------------------
DROP TABLE IF EXISTS `programas`;
CREATE TABLE `programas`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for programasxciudad
-- ----------------------------
DROP TABLE IF EXISTS `programasxciudad`;
CREATE TABLE `programasxciudad`  (
  `id_programa` int NOT NULL,
  `id_ciudad` int NOT NULL,
  PRIMARY KEY (`id_programa`, `id_ciudad`) USING BTREE,
  INDEX `id_ciudad`(`id_ciudad`) USING BTREE,
  CONSTRAINT `programasxciudad_ibfk_1` FOREIGN KEY (`id_programa`) REFERENCES `programas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `programasxciudad_ibfk_2` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for programasxconvocatoria
-- ----------------------------
DROP TABLE IF EXISTS `programasxconvocatoria`;
CREATE TABLE `programasxconvocatoria`  (
  `id_convocatoria` int NOT NULL,
  `id_programa` int NOT NULL,
  PRIMARY KEY (`id_convocatoria`, `id_programa`) USING BTREE,
  INDEX `id_programa`(`id_programa`) USING BTREE,
  CONSTRAINT `programasxconvocatoria_ibfk_1` FOREIGN KEY (`id_convocatoria`) REFERENCES `convocatorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `programasxconvocatoria_ibfk_2` FOREIGN KEY (`id_programa`) REFERENCES `programas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for roles_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `roles_usuarios`;
CREATE TABLE `roles_usuarios`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for subcriterios_evaluacion
-- ----------------------------
DROP TABLE IF EXISTS `subcriterios_evaluacion`;
CREATE TABLE `subcriterios_evaluacion`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_criterio` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_criterio`(`id_criterio`) USING BTREE,
  CONSTRAINT `subcriterios_evaluacion_ibfk_1` FOREIGN KEY (`id_criterio`) REFERENCES `criterios_evaluacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tipos_identificacion
-- ----------------------------
DROP TABLE IF EXISTS `tipos_identificacion`;
CREATE TABLE `tipos_identificacion`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for universidades
-- ----------------------------
DROP TABLE IF EXISTS `universidades`;
CREATE TABLE `universidades`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tipo_id` int NOT NULL,
  `nro_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombres` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellidos` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telefono` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clave` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_rol` int NOT NULL,
  `id_universidad` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_tipo_id`(`id_tipo_id`) USING BTREE,
  INDEX `id_rol`(`id_rol`) USING BTREE,
  INDEX `id_universidad`(`id_universidad`) USING BTREE,
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_tipo_id`) REFERENCES `tipos_identificacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles_usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`id_universidad`) REFERENCES `universidades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;

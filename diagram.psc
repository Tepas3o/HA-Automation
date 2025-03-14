Algoritmo GildaDeferredPlugRequestAutomation
	// Definición de variables de entrada
	Definir load Como Real
	Definir co2_cost Como Real
	Definir kwh_cost Como Real
	Definir time_horizon Como Cadena
	Definir on_duration Como Cadena
	Definir sample_frequency Como Cadena
	Definir start_button Como Cadena
	Definir min_temperature Como Entero
	Definir initial_boil Como Lógico
	Definir trigger_input_boolean Como Cadena
	Definir timer_entity Como Cadena
	Definir co2_intensity_entity Como Cadena
	Definir gilda_host Como Cadena
	Definir gilda_opts_port Como Entero
	Definir gilda_local_port Como Entero
	Definir sql_user Como Cadena
	Definir sql_password Como Cadena
	Definir sql_host Como Cadena
	Definir sql_database Como Cadena
	Definir sql_port Como Entero
	Definir trigger_id Como Cadena
	Definir resultado Como Lógico
	Definir partes Como Cadena
	// Inicializar variables con valores de ejemplo
	load <- 1000.0
	co2_cost <- 10.0
	kwh_cost <- 150.0
	time_horizon <- '24:00:00'
	on_duration <- '01:00:00'
	sample_frequency <- '00:15:00'
	start_button <- 'switch.mi_dispositivo'
	min_temperature <- 80
	initial_boil <- Verdadero
	trigger_input_boolean <- 'input_boolean.mi_trigger'
	timer_entity <- 'timer.mi_timer'
	co2_intensity_entity <- 'sensor.co2_intensity'
	gilda_host <- 'homeassistant.local'
	gilda_opts_port <- 5012
	gilda_local_port <- 5024
	sql_user <- 'homeassistant'
	sql_password <- 'gilda'
	sql_host <- 'homeassistant.local'
	sql_database <- 'homeassistant'
	sql_port <- 3306
	// Simular un trigger
	trigger_id <- 'deferred_start'
	// Manejar el trigger según su tipo
	Escribir 'Procesando trigger: ', trigger_id
	Según trigger_id Hacer
		'deferred_start':
			Si initial_boil Entonces
				// Verificar tipo de start_button y activarlo
				Si Subcadena(start_button,0,6)='button.' Entonces
					Escribir 'Presionando botón: ', start_button
				SiNo
					Si Subcadena(start_button,0,6)='switch.' Entonces
						Escribir 'Encendiendo switch: ', start_button
					FinSi
				FinSi
				// Esperar 30 segundos o hasta que trigger_input_boolean cambie a "off"
				Escribir 'Esperando 30 segundos o hasta que ', trigger_input_boolean, ' cambie a off'
				// Apagar el start_button
				Si Subcadena(start_button,0,6)='button.' Entonces
					Escribir 'Presionando botón: ', start_button
				SiNo
					Si Subcadena(start_button,0,6)='switch.' Entonces
						Escribir 'Apagando switch: ', start_button
					FinSi
				FinSi
			FinSi
			// Llamar a la función de Gilda para programar la carga diferida
			Escribir 'Llamando a Gilda para programar carga diferida con parámetros:'
			Escribir '  - load: ', load/1000.0
			Escribir '  - on_duration: ', on_duration
			Escribir '  - time_horizon: ', time_horizon
			Escribir '  - sample_frequency: ', sample_frequency
			Escribir '  - co2_cost: ', co2_cost
			Escribir '  - kwh_cost: ', kwh_cost
		'stop_timer':
			// Cancelar el timer
			Escribir 'Cancelando timer: ', timer_entity
			Si Subcadena(start_button,0,6)='button.' Entonces
				Escribir 'Presionando botón: ', start_button
				// Apagar el start_button
			SiNo
				Si Subcadena(start_button,0,6)='switch.' Entonces
					Escribir 'Apagando switch: ', start_button
				FinSi
			FinSi
		'ti‰‰‰mer_finished':
			// Activar el start_button
			Si Subcadena(start_button,0,6)='button.' Entonces
				Escribir 'Presionando botón: ', start_button
			SiNo
				Si Subcadena(start_button,0,6)='switch.' Entonces
					Escribir 'Encendiendo switch: ', start_button
				FinSi
			FinSi
			// Esperar el tiempo definido en on_duration
			Escribir 'Esperando: ', on_duration
			// Apagar el start_button
			Si Subcadena(start_button,0,6)='button.' Entonces
				Escribir 'Presionando botón: ', start_button
			SiNo
				Si Subcadena(start_button,0,6)='switch.' Entonces
					Escribir 'Apagando switch: ', start_button
				FinSi
			FinSi
			// Apagar el input_boolean
			Escribir 'Apagando input_boolean: ', trigger_input_boolean
		'timer_started':
			// No hay acciones específicas para este trigger
			Escribir 'Timer iniciado, no se requieren acciones específicas'
	FinSegún
	Escribir 'Fin del procesamiento del trigger'
FinAlgoritmo

# coding: utf-8

puts 'Seeding the equipment...'

[
    {
        code: 'CCT-00012/2015', 
        name: 'Colorímetro', 
        location: nil, 
        calibration_unit: 'ABS',
        calibration_start: '0.59',
        calibration_end: '1.77',
        uncertainty: '0.1'   
    },
    {
        code: 'CCT-00011/2015', 
        name: 'Medidor de Oxigêncio', 
        location: nil, 
        calibration_unit: 'mg/L',
        calibration_start: '0.1',
        calibration_end: '1000',
        uncertainty: '0.6'  
    },
    {
        code: 'CCL-3081/2014', 
        name: 'Termômetro', 
        location: nil, 
        calibration_unit: '°C',
        calibration_start: '-10',
        calibration_end: '40',
        uncertainty: '0.07'  
    },
    {
        code: 'CCL-3086/2014', 
        name: 'Termômetro', 
        location: nil, 
        calibration_unit: '°C',
        calibration_start: '-10',
        calibration_end: '40',
        uncertainty: '0.07' 
    },
    {
        code: 'CCL-3082/2014', 
        name: 'Termômetro', 
        location: nil, 
        calibration_unit: '°C',
        calibration_start: '-25',
        calibration_end: '110',
        uncertainty: '0.07' 
    },
    {
        code: 'CCL-3083/2014', 
        name: 'Termômetro', 
        location: nil, 
        calibration_unit: '°C',
        calibration_start: '-25',
        calibration_end: '110',
        uncertainty: '0.07' 
    },
    {
        code: 'CCL-3080/2014', 
        name: 'Termômetro', 
        location: nil, 
        calibration_unit: '°C',
        calibration_start: '10',
        calibration_end: '30',
        uncertainty: '0.07' 
    },
    {
        code: 'CCL-3079/2014', 
        name: 'Termômetro', 
        location: nil, 
        calibration_unit: '°C',
        calibration_start: '10',
        calibration_end: '30',
        uncertainty: '0.07' 
    },
    {
        code: 'CCL-3078/2014', 
        name: 'Termômetro', 
        location: nil, 
        calibration_unit: '°C',
        calibration_start: '10',
        calibration_end: '30',
        uncertainty: '0.07' 
    },
    {
        code: 'CCL-228/2015', 
        name: 'Manômetro', 
        location: nil, 
        calibration_unit: 'Bar',
        calibration_start: '0',
        calibration_end: '6',
        uncertainty: '0.28' 
    },
    {
        code: 'CCL-493/2015', 
        name: 'pHmetro', 
        location: nil, 
        calibration_unit: 'pH',
        calibration_start: '4',
        calibration_end: '10',
        uncertainty: nil 
    },
    {
        code: 'CCL-494/2015', 
        name: 'Condutivímetro', 
        location: nil, 
        calibration_unit: 'us/cm2',
        calibration_start: '200',
        calibration_end: '1999',
        uncertainty: '0.07' 
    },
    {
        code: 'CCL-1037/2015', 
        name: 'Balança', 
        location: nil, 
        calibration_unit: 'g',
        calibration_start: '0.50',
        calibration_end: '32000',
        uncertainty: '0.01' 
    },
    {
        code: 'CCL-11252/2014', 
        name: 'Balança', 
        location: nil, 
        calibration_unit: 'g',
        calibration_start: '0.0010',
        calibration_end: '220.00',
        uncertainty: nil 
    }
].each { |equipment|
    Equipment.find_or_create_by(code: equipment[:code]) do |e|
        e.name = equipment[:name]
        e.location = equipment[:location]
        e.calibration_unit = equipment[:calibration_unit]
        e.calibration_start = equipment[:calibration_start]
        e.calibration_end = equipment[:calibration_end]
        e.uncertainty = equipment[:uncertainty]
    end
}
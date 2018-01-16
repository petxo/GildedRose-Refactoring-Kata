Feature: Aged Brie aumenta su calidad
    Incrementa su calidad a medida que se pone viejo

    Scenario Outline: Su calidad aumenta en 1 cuando la fecha de venta no ha vencido
        Given Un Aged Brie con calidad <calidad> y fecha de venta <fechaventa>
        When Se acaba el dia
        Then La calidad es <result>

    Examples:
        | fechaventa | calidad | result |
        | 1          | 1       | 2      |
        | 1          | 49      | 50     |
        | 1          | 50      | 50     |

    Scenario Outline: Su calidad aumenta en 2 cuando la fecha de venta ha vencido
        Given Un Aged Brie con calidad <calidad> y fecha de venta <fechaventa>
        When Se acaba el dia
        Then La calidad es <result>

    Examples:
        | fechaventa | calidad | result |
        | 0          | 1       | 3      |
        | -1         | 48      | 50     |
        | -1         | 49      | 50     |
        | -2         | 50      | 50     |


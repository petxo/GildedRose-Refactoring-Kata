from radish import given, when, then
import os
import sys
sys.path.append(os.path.abspath('./'))

from gilded_rose import Item, GildedRose

@given("Un Aged Brie con calidad {calidad:g} y fecha de venta {fecha_venta:g}")
def tengo_un_brie(step, calidad, fecha_venta):
    step.context.items = [ Item("Aged Brie", fecha_venta, calidad)]

@when("Se acaba el dia")
def update_quality(step):
    gilded_rose = GildedRose(step.context.items)
    gilded_rose.update_quality()    

@then("La calidad es {calidad_esperada:g}")
def comprobar_calidad(step, calidad_esperada):
    assert step.context.items[0].quality == calidad_esperada
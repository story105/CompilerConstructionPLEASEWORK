package CPPScala

import CPP.Yylex
import CPPScala._
import CPPScala.Absyn._
import java.io._
import java_cup.runtime._
import scala.util.{Try, Success, Failure}
import org.scalatest.FunSuite

class TypecheckerTests extends FunSuite {
  test("Testing bad programs") {
    println("------------ Testing bad programs ------------")
    assert(test("src/test/bad", typeCheckBad))
  }

  test("Testing good programs") {
    println("------------ Testing good programs -----------")
    assert(test("src/test/good", typeCheckGood))
  }

  def parseFile(file:File) : Try[Program] = {
    var l : Yylex = null
    try { l = new Yylex(new FileReader(file)) } catch {
      case e:IOException => { 
        return Typechecker.fail(s"Error: File not found: $file")
      }
    }
    val p = new Parser(l)
    var prog : Program = null
    try { prog = p.parseProgram } catch {
      case e: Throwable => {
        return Typechecker.fail("At line " + 
          String.valueOf(l.line_num()) + 
          ", near \"" + l.buff() + "\" :\n"+
          "     " + e.getMessage())
      }
    }
    Success(prog)
  }

  def typeCheckBad(file:File) : Try[Unit] = for {
    prog <- parseFile(file)
    ret <- TypecheckerAlt.typecheck(prog) match {
        case Success(_) => TypecheckerAlt.fail("Should not typecheck")
        case _ => TypecheckerAlt.ok
      }
  } yield ret
  
  def typeCheckGood(file:File) : Try[Unit] = for {
    prog <- parseFile(file)
    ret <- TypecheckerAlt.typecheck(prog)
  } yield ret

  def test(fp:String, fun:File=>Try[Unit]) : Boolean = {
    val progsDir = new File(fp).getAbsoluteFile()

    val progsList = progsDir.listFiles.filter(_.isFile).toList.filter { file =>
        file.getName.endsWith("cc")
    }
    var passing = true
    progsList.foreach {
      f => fun(f) match {
        case Success(_) => println(f +": passed")
        case Failure(e) => { println(f + ": failed\n" + e.toString) ; passing = false }
      }
    }
    return passing
  }
}

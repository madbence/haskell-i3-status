import System.Process
import Control.Concurrent
import Control.Monad
import Text.JSON
import Text.JSON.Types

-- do notation is for lame people, plain code looks more academic ^^!

header :: IO ()
header = putStrLn $ ( encode . makeObj $ [
    ("version", JSRational False 1)
  ]) ++ "\n["

loop :: IO ()
loop = forever $ sleep >> date

sleep = threadDelay 1000000

date :: IO ()
date = readProcess "date" [] [] >>= \date ->
  putStrLn $ ( encode $ JSArray $ [makeObj [
    ("full_text", JSString $ toJSString date),
    ("name", JSString $ toJSString "foobar"),
    ("color", JSString $ toJSString "#FFFFFF")
  ]] ) ++ ","

main =
  header >> loop

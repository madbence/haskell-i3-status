import System.Process
import System.IO
import Control.Concurrent
import Control.Monad
import Text.JSON
import Text.JSON.Types
import Data.List

main = do
  putStrLn $ ( encode . makeObj $ [
      ("version", JSRational False 1)
    ]) ++ "\n["
  forever $ do
    date <- readProcess "date" ["+%Y-%m-%d %H:%M:%S"] []
    putStrLn $ encode $ JSArray $ [makeObj [
        ("name", JSString $ toJSString "date"),
        ("color", JSString $ toJSString "#EEEEEE"),
        ("full_text", JSString $ toJSString $ init date)
      ]]
    hFlush stdout
    putStr ","
    threadDelay 1000000

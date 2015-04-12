module Game.CodeJam (
    solveCase,
    runCodeJam
) where

import Control.Applicative
import Data.Monoid
import System.IO

-- | Solve a testcase using f, then output the solution to stdout.
solveCase :: IO String -> Int -> IO ()
solveCase f n = f >>= printSol
  where
    printSol s = putStrLn $ "Case #" <> show n <> ": " <> s

-- | Run a solution over all testcases (read from stdin).
runCodeJam :: (IO String) -> IO ()
runCodeJam f = do
    testcases <- read <$> getLine
    mapM_ (solveCase f) [1..testcases]

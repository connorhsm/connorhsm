from fnvhash import fnv1a_64
import random
import subprocess

SPAWN_CODE_PEPPER = "xyz".encode("utf-8")
SPAWN_CODE = "abc".encode("utf-8")
BOUNDING_BOX = 40000


def get_spawn_code_coordinates(spawn_code: bytes) -> tuple:
    hashed_spawn_code = fnv1a_64(spawn_code, fnv1a_64(SPAWN_CODE_PEPPER))

    print(hashed_spawn_code)

    # doesnt work

    # random.seed(hashed_spawn_code)
    x = random.randint(-BOUNDING_BOX // 2, BOUNDING_BOX // 2)
    y = random.randint(-BOUNDING_BOX // 2, BOUNDING_BOX // 2)

    print(x, y)

    return int(x), int(y)


if __name__ == "__main__":
    print(get_spawn_code_coordinates(SPAWN_CODE))

    # print(subprocess.run("./main"), "abc")

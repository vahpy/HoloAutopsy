using UnityEngine;

public class HeadDirectionTracker : MonoBehaviour
{
    [SerializeField] private Transform lookDirectionTarget;
    [SerializeField] private Transform model;
    [SerializeField] private float modelRotationSpeed = 40;

    private Transform mainCamera;
    //    private Vector3 defaultForwardVector;

    bool runModelRotate = false;
    void Start()
    {
        mainCamera = Camera.main.transform;
//        defaultForwardVector = model.forward;
    }
    // Update is called once per frame
    void Update()
    {
        lookDirectionTarget.transform.position = mainCamera.forward + mainCamera.position;
        lookDirectionTarget.transform.rotation = mainCamera.rotation;
        model.position = mainCamera.position;
        //Vector3 targetDirection = (new Vector3(lookDirectionTarget.position.x, model.position.y, lookDirectionTarget.position.z) - model.position).normalized;
        Vector3 targetDirection = (lookDirectionTarget.position - model.position).normalized;
        var targetRotation = Quaternion.LookRotation(new Vector3(targetDirection.x,0, targetDirection.z));
        var angle = Quaternion.Angle(model.rotation, targetRotation);
        if (angle < 0.1)
        {
            runModelRotate = false;
        }
        if (runModelRotate || angle > 25)
        {
            model.rotation = Quaternion.RotateTowards(model.rotation, targetRotation, Time.deltaTime * modelRotationSpeed);
            runModelRotate = true;
        }
    }
}
